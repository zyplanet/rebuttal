import networkx as nx
import random
import torch
def gen_base_tree(n,min_ch,max_ch):
    G = nx.Graph()
    G.add_nodes_from(range(n))
    root = [0]
    used = 0
    while used<n-1:
        father = root.pop(0)
        if n-used-1>=min_ch:
            n_child = min(random.randint(min_ch,max_ch),n-used-1)
            new_use = list(range(used+1,used+n_child+1))
            edges = [(father,k) for k in new_use]
            G.add_edges_from(edges)
            root += new_use
            used = used+n_child
        else:
            edges = [(father,k) for k in range(used+1,n)]
            G.add_edges_from(edges)
            used = n-1
    return G

def plant_clique(G,size,height):
    n = G.number_of_nodes()
    if height == "low":
        pos_r = (0.1,0.3)
    elif height == "high":
        pos_r = (0.6,0.9)
    else:
        pos_r = (0.3,0.6)
    pos = random.randint(int(pos_r[0]*n),int(pos_r[1]*n))
    G.add_nodes_from(range(n,n+size))
    edges = [(pos,n)]
    for i in range(n,n+size):
        for j in range(i+1,n+size):
            edges.append((i,j))
    G.add_edges_from(edges)
    return G

def rewrite(G,step,p):
    for i in range(step):
        #select edge
        edges = list(G.edges)
        cand = random.choice(edges)
        if random.uniform(0,1)<p:
            G.remove_edge(*cand)
        n = G.number_of_nodes()
        pair = random.sample(list(range(n)),2)
        if random.uniform(0,1)<p:
            G.add_edge(*pair)
    G.remove_nodes_from(list(nx.isolates(G)))
    return G

def gen_data(num,n,min_ch,max_ch,cliq_size,height,rewrite_step,prob):
    adj_list = []
    for i in range(num):
        base = gen_base_tree(n,min_ch,max_ch)
        planted = plant_clique(base,cliq_size,height)
        noisy = rewrite(planted,rewrite_step,prob)
        adj_list.append(nx.to_numpy_array(noisy))
    save_name = "data/num{}_n{}_{}-{}_cliq{}_h{}_r{}_p{}.pth".format(num,n,min_ch,max_ch,cliq_size,height,rewrite_step,prob)
    torch.save(adj_list,save_name)

def gen_pure_tree_data(num,n,min_ch,max_ch,rewrite_step,prob):
    adj_list = []
    for i in range(num):
        base = gen_base_tree(n,min_ch,max_ch)
        noisy = rewrite(base,rewrite_step,prob)
        adj_list.append(nx.to_numpy_array(noisy))
    save_name = "data/tree/num{}_n{}_{}-{}_r{}_p{}.pth".format(num,n,min_ch,max_ch,rewrite_step,prob)
    torch.save(adj_list,save_name)

if __name__=="__main__":
    num = 400
    n = 20
    min_ch = 1
    max_ch = 3
    cliq_size = 4
    height = "high"
    rewrite_step = 0
    prob = 0.5
    gen_pure_tree_data(num,n,min_ch,max_ch,rewrite_step,prob)
    # gen_data(num,n,min_ch,max_ch,cliq_size,height,rewrite_step,prob)
