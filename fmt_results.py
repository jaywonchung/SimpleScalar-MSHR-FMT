import sys, os, json
import matplotlib.pyplot as plt
import numpy as np

def harmonic_mean(l):
    return len(l) / sum(1/x for x in l)

def arithmetic_mean(l):
    return sum(l) / len(l)

RESULTS_DIR = 'results'
EXP_DIR = sys.argv[1]
STAT_KEY_LIST = ['sim_cycle',
                 'il1.misses', 'il2.misses', 'itlb.misses', 'dl1.misses', 'dl2.misses', 'dtlb.misses', 'misfetch_count',
                 'FMT_il1', 'FMT_il2', 'FMT_itlb', 'FMT_dl1', 'FMT_dl2', 'FMT_dtlb', 'FMT_branch',
                 'SFMT_il1', 'SFMT_il2', 'SFMT_itlb', 'SFMT_dl1', 'SFMT_dl2', 'SFMT_dtlb', 'SFMT_branch']
AGGREGATE_FN_LIST = [sum] * len(STAT_KEY_LIST)

BASE_DIR = os.path.join(RESULTS_DIR, EXP_DIR)
STAT_NAME_LIST = [key.replace('.', '_') for key in STAT_KEY_LIST]
WORKLOAD_LIST = [dir for dir in os.listdir(BASE_DIR) \
                        if os.path.isdir(os.path.join(BASE_DIR, dir))]

results = dict()

for workload_name in WORKLOAD_LIST:
    for result_file in os.listdir(os.path.join(BASE_DIR, workload_name)):
        result_name = '-'.join(result_file.split('-')[:-1])
        if result_name not in results:
            results[result_name] = dict()
        if workload_name not in results[result_name]:
            results[result_name][workload_name] = dict()
        with open(os.path.join(BASE_DIR, workload_name, result_file), 'r') as f:
            for line in f:
                for stat_key in STAT_KEY_LIST:
                    if line[:len(stat_key)] == stat_key:
                        stat_value = float(line.split()[1])
                        if stat_key not in results[result_name][workload_name]:
                            results[result_name][workload_name][stat_key] = list()
                        results[result_name][workload_name][stat_key].append(stat_value)
                        break
print(results)
with open(os.path.join(BASE_DIR, 'results.json'), 'w') as f:
    json.dump(results, f, indent=4, sort_keys=True) 

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
    json.dump(aggregate_across_stats, f, indent=4, sort_keys=True)

d = aggregate_across_stats[sys.argv[1]]['gcc']
print(d)
d = {key:int(val) for key,val in d.items()}
print(d)

naive_il1_miss = 7
naive_il2_miss = 32
naive_itlb_miss = 30
naive_dl1_miss = 7
naive_dl2_miss = 32
naive_dtlb_miss = 30
naive_branch = 2

N = 3
il1 = np.array([d['il1.misses']*naive_il1_miss, d['FMT_il1'], d['SFMT_il1']])
il2 = np.array([d['il2.misses']*naive_il2_miss, d['FMT_il2'], d['SFMT_il2']])
itlb = np.array([d['itlb.misses']*naive_itlb_miss, d['FMT_itlb'], d['SFMT_itlb']])
dl1 = np.array([d['dl1.misses']*naive_dl1_miss, d['FMT_dl1'], d['SFMT_dl1']])
dl2 = np.array([d['dl2.misses']*naive_dl2_miss, d['FMT_dl2'], d['SFMT_dl2']])
dtlb = np.array([d['dtlb.misses']*naive_dtlb_miss, d['FMT_dtlb'], d['SFMT_dtlb']])
branch = np.array([d['misfetch_count']*naive_branch, d['FMT_branch'], d['SFMT_branch']])
base = np.array([d['sim_cycle']-il1[i]-il2[i]-itlb[i]-dl1[i]-dl2[i]-dtlb[i]-branch[i] for i in range(3)])

ind = np.arange(N)    # the x locations for the groups
width = 0.50       # the width of the bars: can also be len(x) sequence

p1 = plt.bar(ind, base, width)
p2 = plt.bar(ind, il1, width, bottom=base)
p3 = plt.bar(ind, il2, width, bottom=il1+base)
p4 = plt.bar(ind, itlb, width, bottom=il2+il1+base)
p5 = plt.bar(ind, dl1, width, bottom=itlb+il2+il1+base)
p6 = plt.bar(ind, dl2, width, bottom=dl1+itlb+il2+il1+base)
p7 = plt.bar(ind, dtlb, width, bottom=dl2+dl1+itlb+il2+il1+base)
p8 = plt.bar(ind, branch, width, bottom=dtlb+dl2+dl1+itlb+il2+il1+base)

plt.title('gcc')
plt.xticks(ind, ('naive', 'FMT', 'sFMT'))
#plt.yticks(np.arange(0, 81, 10))
plt.legend(reversed([p1[0], p2[0], p3[0], p4[0], p5[0], p6[0], p7[0], p8[0]]), reversed(['base', 'L1 I$', 'L2 I$', 'I-TLB', 'L1 D$', 'L2 D$', 'D-TLB', 'bpred']))

plt.show()
