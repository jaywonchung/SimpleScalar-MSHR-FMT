import sys, os, json

def harmonic_mean(l):
    return len(l) / sum(1/x for x in l)

def arithmetic_mean(l):
    return sum(l) / len(l)

RESULTS_DIR = 'results'
EXP_DIR = 'dl1'
STAT_KEY_LIST = ['sim_IPC', 'dl1.accesses', 'dl1.hits', 'dl1.misses']
AGGREGATE_FN_LIST = [harmonic_mean, sum, sum, sum]

BASE_DIR = os.path.join(RESULTS_DIR, EXP_DIR)
STAT_NAME_LIST = [key.replace('.', '_') for key in STAT_KEY_LIST]
WORKLOAD_LIST = [dir for dir in os.listdir(BASE_DIR) \
                        if os.path.isdir(os.path.join(BASE_DIR, dir))]

results = dict()

for workload_name in WORKLOAD_LIST:
    for result_file in os.listdir(os.path.join(BASE_DIR, workload_name)):
        result_name = result_file.split('-')[0]
        if result_name not in results:
            results[result_name] = dict()
        if workload_name not in results[result_name]:
            results[result_name][workload_name] = dict()
        with open(os.path.join(BASE_DIR, workload_name, result_file), 'r') as f:
            for line in f:
                for stat_key in STAT_KEY_LIST:
                    if stat_key in line:
                        stat_value = float(line.split()[1])
                        if stat_key not in results[result_name][workload_name]:
                            results[result_name][workload_name][stat_key] = list()
                        results[result_name][workload_name][stat_key].append(stat_value)
                        break

with open(os.path.join(BASE_DIR, 'results.json'), 'w') as f:
    json.dump(results, f, indent=4) 

aggregate_across_stats = dict()
for result_name, result_dict in results.items():
    aggregate_dict = dict()
    for workload_name, workload_dict in result_dict.items():
        aggregate_dict[workload_name] = dict()
        for stat_key, stat_list in workload_dict.items():
            aggregate_dict[workload_name][stat_key] = \
                    AGGREGATE_FN_LIST[STAT_KEY_LIST.index(stat_key)](stat_list)
    aggregate_across_stats[result_name] = aggregate_dict

with open(os.path.join(BASE_DIR, 'results.json'), 'a') as f:
    f.write('\n\n\nAGGREGATE ACROSS STATS\n')
    json.dump(aggregate_across_stats, f, indent=4)

aggregate_across_workloads = dict()
for result_name, result_dict in aggregate_across_stats.items():
    aggregate_dict = dict()
    for stat_key in STAT_KEY_LIST:
        stat_list = list()
        for workload_name, workload_dict in result_dict.items():
            stat_list.append(workload_dict[stat_key])
        aggregate_dict[stat_key] = \
                AGGREGATE_FN_LIST[STAT_KEY_LIST.index(stat_key)](stat_list)
    aggregate_across_workloads[result_name] = aggregate_dict

with open(os.path.join(BASE_DIR, 'results.json'), 'a') as f:
    f.write('\n\n\nAGGREGATE ACROSS WORKLOADS\n')
    json.dump(aggregate_across_workloads, f, indent=4)
