function [bus,branch,chaves] = Sis_119bus()

% No	Tipo	Vpu	Teta	Pcarga	Qcarga	Pger	Qger
bus = [
119	1	11	0	0	0	0	0
1	3	11	0	0	0	0	0
2	1	11	0	133.84	101.14	0	0
3	1	11	0	16.214	11.292	0	0
4	1	11	0	34.315	21.845	0	0
5	1	11	0	73.016	63.602	0	0
6	1	11	0	144.2	68.604	0	0
7	1	11	0	104.47	61.725	0	0
8	1	11	0	28.547	11.503	0	0
9	1	11	0	87.56	51.073	0	0
10	1	11	0	198.2	106.77	0	0
11	1	11	0	146.8	75.995	0	0
12	1	11	0	26.04	18.687	0	0
13	1	11	0	52.1	23.22	0	0
14	1	11	0	141.9	117.5	0	0
15	1	11	0	21.87	28.79	0	0
16	1	11	0	33.37	26.45	0	0
17	1	11	0	32.43	25.23	0	0
18	1	11	0	20.234	11.906	0	0
19	1	11	0	156.94	78.523	0	0
20	1	11	0	546.29	351.4	0	0
21	1	11	0	180.31	164.2	0	0
22	1	11	0	93.167	54.594	0	0
23	1	11	0	85.18	39.65	0	0
24	1	11	0	168.1	95.178	0	0
25	1	11	0	125.11	150.22	0	0
26	1	11	0	16.03	24.62	0	0
27	1	11	0	26.03	24.62	0	0
28	1	11	0	594.56	522.62	0	0
29	1	11	0	120.62	59.117	0	0
30	1	11	0	102.38	99.554	0	0
31	1	11	0	513.4	318.5	0	0
32	1	11	0	475.25	456.14	0	0
33	1	11	0	151.43	136.79	0	0
34	1	11	0	205.38	83.302	0	0
35	1	11	0	131.6	93.082	0	0
36	1	11	0	448.4	369.79	0	0
37	1	11	0	440.52	321.64	0	0
38	1	11	0	112.54	55.134	0	0
39	1	11	0	53.963	38.998	0	0
40	1	11	0	393.05	342.6	0	0
41	1	11	0	326.74	278.56	0	0
42	1	11	0	536.26	240.24	0	0
43	1	11	0	76.247	66.562	0	0
44	1	11	0	53.52	39.76	0	0
45	1	11	0	40.328	31.964	0	0
46	1	11	0	39.653	20.758	0	0
47	1	11	0	66.195	42.361	0	0
48	1	11	0	73.904	51.653	0	0
49	1	11	0	114.77	57.965	0	0
50	1	11	0	918.37	1205.1	0	0
51	1	11	0	210.3	146.66	0	0
52	1	11	0	66.68	56.608	0	0
53	1	11	0	42.207	40.184	0	0
54	1	11	0	433.74	283.41	0	0
55	1	11	0	62.1	26.86	0	0
56	1	11	0	92.46	88.38	0	0
57	1	11	0	85.188	55.436	0	0
58	1	11	0	345.3	332.4	0	0
59	1	11	0	22.5	16.83	0	0
60	1	11	0	80.551	49.156	0	0
61	1	11	0	95.86	90.758	0	0
62	1	11	0	62.92	47.7	0	0
63	1	11	0	478.8	463.74	0	0
64	1	11	0	120.94	52.006	0	0
65	1	11	0	139.11	100.34	0	0
66	1	11	0	391.78	193.5	0	0
67	1	11	0	27.741	26.713	0	0
68	1	11	0	52.814	25.257	0	0
69	1	11	0	66.89	38.713	0	0
70	1	11	0	467.5	395.14	0	0
71	1	11	0	594.85	239.74	0	0
72	1	11	0	132.5	84.363	0	0
73	1	11	0	52.699	22.482	0	0
74	1	11	0	869.79	614.775	0	0
75	1	11	0	31.349	29.817	0	0
76	1	11	0	192.39	122.43	0	0
77	1	11	0	65.75	45.37	0	0
78	1	11	0	238.15	223.22	0	0
79	1	11	0	294.55	162.47	0	0
80	1	11	0	485.57	437.92	0	0
81	1	11	0	243.53	183.03	0	0
82	1	11	0	243.53	183.03	0	0
83	1	11	0	134.25	119.29	0	0
84	1	11	0	22.71	27.96	0	0
85	1	11	0	49.513	26.515	0	0
86	1	11	0	383.78	257.16	0	0
87	1	11	0	49.64	20.6	0	0
88	1	11	0	22.473	11.806	0	0
89	1	11	0	62.93	42.96	0	0
90	1	11	0	30.67	34.93	0	0
91	1	11	0	62.53	66.79	0	0
92	1	11	0	114.57	81.748	0	0
93	1	11	0	81.292	66.526	0	0
94	1	11	0	31.733	15.96	0	0
95	1	11	0	33.32	60.48	0	0
96	1	11	0	531.28	224.85	0	0
97	1	11	0	507.03	367.42	0	0
98	1	11	0	26.39	11.7	0	0
99	1	11	0	45.99	30.392	0	0
100	1	11	0	100.66	47.572	0	0
101	1	11	0	456.48	350.3	0	0
102	1	11	0	522.56	449.29	0	0
103	1	11	0	408.43	168.46	0	0
104	1	11	0	141.48	134.25	0	0
105	1	11	0	104.43	66.024	0	0
106	1	11	0	96.793	83.647	0	0
107	1	11	0	493.92	419.34	0	0
108	1	11	0	225.38	135.88	0	0
109	1	11	0	509.21	387.21	0	0
110	1	11	0	188.5	173.46	0	0
111	1	11	0	918.03	898.55	0	0
112	1	11	0	305.08	215.37	0	0
113	1	11	0	54.38	40.97	0	0
114	1	11	0	211.14	192.9	0	0
115	1	11	0	67.009	53.336	0	0
116	1	11	0	162.07	90.321	0	0
117	1	11	0	48.785	29.156	0	0
118	1	11	0	33.9	18.98	0	0
];

% 
% % numeracao original sem barras 28, 39,57,92, 104
% barras = [
% 124	1	11	0	0	0	0	0
% 1	3	11	0	0	0	0	0
% 2	1	11	0	133.84	101.14	0	0
% 3	1	11	0	16.214	11.292	0	0
% 4	1	11	0	34.315	21.845	0	0
% 5	1	11	0	73.016	63.602	0	0
% 6	1	11	0	144.2	68.604	0	0
% 7	1	11	0	104.47	61.725	0	0
% 8	1	11	0	28.547	11.503	0	0
% 9	1	11	0	87.56	51.073	0	0
% 10	1	11	0	198.2	106.77	0	0
% 11	1	11	0	146.8	75.995	0	0
% 12	1	11	0	26.04	18.687	0	0
% 13	1	11	0	52.1	23.22	0	0
% 14	1	11	0	141.9	117.5	0	0
% 15	1	11	0	21.87	28.79	0	0
% 16	1	11	0	33.37	26.45	0	0
% 17	1	11	0	32.43	25.23	0	0
% 18	1	11	0	20.234	11.906	0	0
% 19	1	11	0	156.94	78.523	0	0
% 20	1	11	0	546.29	351.4	0	0
% 21	1	11	0	180.31	164.2	0	0
% 22	1	11	0	93.167	54.594	0	0
% 23	1	11	0	85.18	39.65	0	0
% 24	1	11	0	168.1	95.178	0	0
% 25	1	11	0	125.11	150.22	0	0
% 26	1	11	0	16.03	24.62	0	0
% 27	1	11	0	26.03	24.62	0	0
% 29	1	11	0	594.56	522.62	0	0
% 30	1	11	0	120.62	59.117	0	0
% 31	1	11	0	102.38	99.554	0	0
% 32	1	11	0	513.4	318.5	0	0
% 33	1	11	0	475.25	456.14	0	0
% 34	1	11	0	151.43	136.79	0	0
% 35	1	11	0	205.38	83.302	0	0
% 36	1	11	0	131.6	93.082	0	0
% 37	1	11	0	448.4	369.79	0	0
% 38	1	11	0	440.52	321.64	0	0
% 40	1	11	0	112.54	55.134	0	0
% 41	1	11	0	53.963	38.998	0	0
% 42	1	11	0	393.05	342.6	0	0
% 43	1	11	0	326.74	278.56	0	0
% 44	1	11	0	536.26	240.24	0	0
% 45	1	11	0	76.247	66.562	0	0
% 46	1	11	0	53.52	39.76	0	0
% 47	1	11	0	40.328	31.964	0	0
% 48	1	11	0	39.653	20.758	0	0
% 49	1	11	0	66.195	42.361	0	0
% 50	1	11	0	73.904	51.653	0	0
% 51	1	11	0	114.77	57.965	0	0
% 52	1	11	0	918.37	1205.1	0	0
% 53	1	11	0	210.3	146.66	0	0
% 54	1	11	0	66.68	56.608	0	0
% 55	1	11	0	42.207	40.184	0	0
% 56	1	11	0	433.74	283.41	0	0
% 58	1	11	0	62.1	26.86	0	0
% 59	1	11	0	92.46	88.38	0	0
% 60	1	11	0	85.188	55.436	0	0
% 61	1	11	0	345.3	332.4	0	0
% 62	1	11	0	22.5	16.83	0	0
% 63	1	11	0	80.551	49.156	0	0
% 64	1	11	0	95.86	90.758	0	0
% 65	1	11	0	62.92	47.7	0	0
% 66	1	11	0	478.8	463.74	0	0
% 67	1	11	0	120.94	52.006	0	0
% 68	1	11	0	139.11	100.34	0	0
% 69	1	11	0	391.78	193.5	0	0
% 70	1	11	0	27.741	26.713	0	0
% 71	1	11	0	52.814	25.257	0	0
% 72	1	11	0	66.89	38.713	0	0
% 73	1	11	0	467.5	395.14	0	0
% 74	1	11	0	594.85	239.74	0	0
% 75	1	11	0	132.5	84.363	0	0
% 76	1	11	0	52.699	22.482	0	0
% 77	1	11	0	869.79	614.775	0	0
% 78	1	11	0	31.349	29.817	0	0
% 79	1	11	0	192.39	122.43	0	0
% 80	1	11	0	65.75	45.37	0	0
% 81	1	11	0	238.15	223.22	0	0
% 82	1	11	0	294.55	162.47	0	0
% 83	1	11	0	485.57	437.92	0	0
% 84	1	11	0	243.53	183.03	0	0
% 85	1	11	0	243.53	183.03	0	0
% 86	1	11	0	134.25	119.29	0	0
% 87	1	11	0	22.71	27.96	0	0
% 88	1	11	0	49.513	26.515	0	0
% 89	1	11	0	383.78	257.16	0	0
% 90	1	11	0	49.64	20.6	0	0
% 91	1	11	0	22.473	11.806	0	0
% 93	1	11	0	62.93	42.96	0	0
% 94	1	11	0	30.67	34.93	0	0
% 95	1	11	0	62.53	66.79	0	0
% 96	1	11	0	114.57	81.748	0	0
% 97	1	11	0	81.292	66.526	0	0
% 98	1	11	0	31.733	15.96	0	0
% 99	1	11	0	33.32	60.48	0	0
% 100	1	11	0	531.28	224.85	0	0
% 101	1	11	0	507.03	367.42	0	0
% 102	1	11	0	26.39	11.7	0	0
% 103	1	11	0	45.99	30.392	0	0
% 105	1	11	0	100.66	47.572	0	0
% 106	1	11	0	456.48	350.3	0	0
% 107	1	11	0	522.56	449.29	0	0
% 108	1	11	0	408.43	168.46	0	0
% 109	1	11	0	141.48	134.25	0	0
% 110	1	11	0	104.43	66.024	0	0
% 111	1	11	0	96.793	83.647	0	0
% 112	1	11	0	493.92	419.34	0	0
% 113	1	11	0	225.38	135.88	0	0
% 114	1	11	0	509.21	387.21	0	0
% 115	1	11	0	188.5	173.46	0	0
% 116	1	11	0	918.03	898.55	0	0
% 117	1	11	0	305.08	215.37	0	0
% 118	1	11	0	54.38	40.97	0	0
% 119	1	11	0	211.14	192.9	0	0
% 120	1	11	0	67.009	53.336	0	0
% 121	1	11	0	162.07	90.321	0	0
% 122	1	11	0	48.785	29.156	0	0
% 123	1	11	0	33.9	18.98	0	0
% ];

% De	Para	R(ohm)	X(ohm)	Comprimento(km)	Ampacidade(A)
branch = [
119	1	0.0001	0.0001	1	500
1	2	0.036	0.01296	1	500
2	3	0.033	0.01188	1	500
2	4	0.045	0.0162	1	500
4	5	0.015	0.054	1	500
5	6	0.015	0.054	1	500
6	7	0.015	0.0125	1	500
7	8	0.018	0.014	1	500
8	9	0.021	0.063	1	500
2	10	0.166	0.1344	1	500
10	11	0.112	0.0789	1	500
11	12	0.187	0.313	1	500
12	13	0.142	0.1512	1	500
13	14	0.18	0.118	1	500
14	15	0.15	0.045	1	500
15	16	0.16	0.18	1	500
16	17	0.157	0.171	1	500
11	18	0.218	0.285	1	500
18	19	0.118	0.185	1	500
19	20	0.16	0.196	1	500
20	21	0.12	0.189	1	500
21	22	0.12	0.0789	1	500
22	23	1.41	0.723	1	500
23	24	0.293	0.1348	1	500
24	25	0.133	0.104	1	500
25	26	0.178	0.134	1	500
26	27	0.178	0.134	1	500
4	28	0.015	0.0296	1	500
28	29	0.012	0.0276	1	500
29	30	0.12	0.2766	1	500
30	31	0.21	0.243	1	500
31	32	0.12	0.054	1	500
32	33	0.178	0.234	1	500
33	34	0.178	0.234	1	500
34	35	0.154	0.162	1	500
30	36	0.187	0.261	1	500
36	37	0.133	0.099	1	500
29	38	0.33	0.194	1	500
38	39	0.31	0.194	1	500
39	40	0.13	0.194	1	500
40	41	0.28	0.15	1	500
41	42	1.18	0.85	1	500
42	43	0.42	0.2436	1	500
43	44	0.27	0.0972	1	500
44	45	0.339	0.1221	1	500
45	46	0.27	0.1779	1	500
35	47	0.21	0.1383	1	500
47	48	0.12	0.0789	1	500
48	49	0.15	0.0987	1	500
49	50	0.15	0.0987	1	500
50	51	0.24	0.1581	1	500
51	52	0.12	0.0789	1	500
52	53	0.405	0.1458	1	500
52	54	0.405	0.1458	1	500
29	55	0.391	0.141	1	500
55	56	0.406	0.1461	1	500
56	57	0.406	0.1461	1	500
57	58	0.706	0.5461	1	500
58	59	0.338	0.1218	1	500
59	60	0.338	0.1218	1	500
60	61	0.207	0.0747	1	500
61	62	0.247	0.8922	1	500
1	63	0.028	0.0418	1	500
63	64	0.117	0.2016	1	500
64	65	0.255	0.0918	1	500
65	66	0.21	0.0759	1	500
66	67	0.383	0.138	1	500
67	68	0.504	0.3303	1	500
68	69	0.406	0.1461	1	500
69	70	0.962	0.761	1	500
70	71	0.165	0.06	1	500
71	72	0.303	0.1092	1	500
72	73	0.303	0.1092	1	500
73	74	0.206	0.144	1	500
74	75	0.233	0.084	1	500
75	76	0.591	0.1773	1	500
76	77	0.126	0.0453	1	500
64	78	0.559	0.3687	1	500
78	79	0.186	0.1227	1	500
79	80	0.186	0.1227	1	500
80	81	0.26	0.139	1	500
81	82	0.154	0.148	1	500
82	83	0.23	0.128	1	500
83	84	0.252	0.106	1	500
84	85	0.18	0.148	1	500
79	86	0.16	0.182	1	500
86	87	0.2	0.23	1	500
87	88	0.16	0.393	1	500
65	89	0.669	0.2412	1	500
89	90	0.266	0.1227	1	500
90	91	0.266	0.1227	1	500
91	92	0.266	0.1227	1	500
92	93	0.266	0.1227	1	500
93	94	0.233	0.115	1	500
94	95	0.496	0.138	1	500
91	96	0.196	0.18	1	500
96	97	0.196	0.18	1	500
97	98	0.1866	0.122	1	500
98	99	0.0746	0.318	1	500
1	100	0.0625	0.0265	1	500
100	101	0.1501	0.234	1	500
101	102	0.1347	0.0888	1	500
102	103	0.2307	0.1203	1	500
103	104	0.447	0.1608	1	500
104	105	0.1632	0.0588	1	500
105	106	0.33	0.099	1	500
106	107	0.156	0.0561	1	500
107	108	0.3819	0.1374	1	500
108	109	0.1626	0.0585	1	500
109	110	0.3819	0.1374	1	500
110	111	0.2445	0.0879	1	500
110	112	0.2088	0.0753	1	500
112	113	0.2301	0.0828	1	500
100	114	0.6102	0.2196	1	500
114	115	0.1866	0.127	1	500
115	116	0.3732	0.246	1	500
116	117	0.405	0.367	1	500
117	118	0.489	0.438	1	500
46	27	0.5258	0.2925	1	500
17	27	0.5258	0.2916	1	500
8	24	0.4272	0.1539	1	500
54	43	0.48	0.1728	1	500
62	49	0.36	0.1296	1	500
37	62	0.57	0.572	1	500
9	40	0.53	0.3348	1	500
58	96	0.3957	0.1425	1	500
73	91	0.68	0.648	1	500
88	75	0.4062	0.1464	1	500
99	77	0.4626	0.1674	1	500
108	83	0.651	0.234	1	500
105	86	0.8125	0.2925	1	500
110	118	0.7089	0.2553	1	500
25	35	0.5	0.5	1	500
];

% IdLinha	No_Emissor	No_Receptor		Tipo		Operacional			Estado
%                                       (NA=1/NF=0)	(0-inativo,1-ativo)	(0-aberta,1-fechada)
chaves = [
1	119	1	1	1	1
2	1	2	1	1	1
3	2	3	1	1	1
4	2	4	1	1	1
5	4	5	1	1	1
6	5	6	1	1	1
7	6	7	1	1	1
8	7	8	1	1	1
9	8	9	1	1	1
10	2	10	1	1	1
11	10	11	1	1	1
12	11	12	1	1	1
13	12	13	1	1	1
14	13	14	1	1	1
15	14	15	1	1	1
16	15	16	1	1	1
17	16	17	1	1	1
18	11	18	1	1	1
19	18	19	1	1	1
20	19	20	1	1	1
21	20	21	1	1	1
22	21	22	1	1	1
23	22	23	1	1	1
24	23	24	1	1	1
25	24	25	1	1	1
26	25	26	1	1	1
27	26	27	1	1	1
28	4	28	1	1	1
29	28	29	1	1	1
30	29	30	1	1	1
31	30	31	1	1	1
32	31	32	1	1	1
33	32	33	1	1	1
34	33	34	1	1	1
35	34	35	1	1	1
36	30	36	1	1	1
37	36	37	1	1	1
38	29	38	1	1	1
39	38	39	1	1	1
40	39	40	1	1	1
41	40	41	1	1	1
42	41	42	1	1	1
43	42	43	1	1	1
44	43	44	1	1	1
45	44	45	1	1	1
46	45	46	1	1	1
47	35	47	1	1	1
48	47	48	1	1	1
49	48	49	1	1	1
50	49	50	1	1	1
51	50	51	1	1	1
52	51	52	1	1	1
53	52	53	1	1	1
54	52	54	1	1	1
55	29	55	1	1	1
56	55	56	1	1	1
57	56	57	1	1	1
58	57	58	1	1	1
59	58	59	1	1	1
60	59	60	1	1	1
61	60	61	1	1	1
62	61	62	1	1	1
63	1	63	1	1	1
64	63	64	1	1	1
65	64	65	1	1	1
66	65	66	1	1	1
67	66	67	1	1	1
68	67	68	1	1	1
69	68	69	1	1	1
70	69	70	1	1	1
71	70	71	1	1	1
72	71	72	1	1	1
73	72	73	1	1	1
74	73	74	1	1	1
75	74	75	1	1	1
76	75	76	1	1	1
77	76	77	1	1	1
78	64	78	1	1	1
79	78	79	1	1	1
80	79	80	1	1	1
81	80	81	1	1	1
82	81	82	1	1	1
83	82	83	1	1	1
84	83	84	1	1	1
85	84	85	1	1	1
86	79	86	1	1	1
87	86	87	1	1	1
88	87	88	1	1	1
89	65	89	1	1	1
90	89	90	1	1	1
91	90	91	1	1	1
92	91	92	1	1	1
93	92	93	1	1	1
94	93	94	1	1	1
95	94	95	1	1	1
96	91	96	1	1	1
97	96	97	1	1	1
98	97	98	1	1	1
99	98	99	1	1	1
100	1	100	1	1	1
101	100	101	1	1	1
102	101	102	1	1	1
103	102	103	1	1	1
104	103	104	1	1	1
105	104	105	1	1	1
106	105	106	1	1	1
107	106	107	1	1	1
108	107	108	1	1	1
109	108	109	1	1	1
110	109	110	1	1	1
111	110	111	1	1	1
112	110	112	1	1	1
113	112	113	1	1	1
114	100	114	1	1	1
115	114	115	1	1	1
116	115	116	1	1	1
117	116	117	1	1	1
118	117	118	1	1	1
119	46	27	0	1	0
120	17	27	0	1	0
121	8	24	0	1	0
122	54	43	0	1	0
123	62	49	0	1	0
124	37	62	0	1	0
125	9	40	0	1	0
126	58	96	0	1	0
127	73	91	0	1	0
128	88	75	0	1	0
129	99	77	0	1	0
130	108	83	0	1	0
131	105	86	0	1	0
132	110	118	0	1	0
133	25	35	0	1	0
];

% chaves = [
% 1	119	1	1	1	1 % OBS: alterado bus n.0 to n.119
% 2	1	2	1	1	1
% 3	2	3	1	1	1
% 4	2	4	1	1	1
% 5	4	5	1	1	1
% 6	5	6	1	1	1
% 7	6	7	1	1	1
% 8	7	8	1	1	1
% 9	8	9	1	1	1
% 10	2	10	1	1	1
% 11	10	11	1	1	1
% 12	11	12	1	1	1
% 13	12	13	1	1	1
% 14	13	14	1	1	1
% 15	14	15	1	1	1
% 16	15	16	1	1	1
% 17	16	17	1	1	1
% 18	11	18	1	1	1
% 19	18	19	1	1	1
% 20	19	20	1	1	1
% 21	20	21	1	1	1
% 22	21	22	1	1	1
% 23	22	23	1	1	1
% 24	23	24	1	1	1
% 25	24	25	1	1	1
% 26	25	26	1	1	1
% 27	26	27	1	1	1
% 28	4	29	1	1	1
% 29	29	30	1	1	1
% 30	30	31	1	1	1
% 31	31	32	1	1	1
% 32	32	33	1	1	1
% 33	33	34	1	1	1
% 34	34	35	1	1	1
% 35	35	36	1	1	1
% 36	31	37	1	1	1
% 37	37	38	1	1	1
% 38	30	40	1	1	1
% 39	40	41	1	1	1
% 40	41	42	1	1	1
% 41	42	43	1	1	1
% 42	43	44	1	1	1
% 43	44	45	1	1	1
% 44	45	46	1	1	1
% 45	46	47	1	1	1
% 46	47	48	1	1	1
% 47	36	49	1	1	1
% 48	49	50	1	1	1
% 49	50	51	1	1	1
% 50	51	52	1	1	1
% 51	52	53	1	1	1
% 52	53	54	1	1	1
% 53	54	55	1	1	1
% 54	54	56	1	1	1
% 55	30	58	1	1	1
% 56	58	59	1	1	1
% 57	59	60	1	1	1
% 58	60	61	1	1	1
% 59	61	62	1	1	1
% 60	62	63	1	1	1
% 61	63	64	1	1	1
% 62	64	65	1	1	1
% 63	1	66	1	1	1
% 64	66	67	1	1	1
% 65	67	68	1	1	1
% 66	68	69	1	1	1
% 67	69	70	1	1	1
% 68	70	71	1	1	1
% 69	71	72	1	1	1
% 70	72	73	1	1	1
% 71	73	74	1	1	1
% 72	74	75	1	1	1
% 73	75	76	1	1	1
% 74	76	77	1	1	1
% 75	77	78	1	1	1
% 76	78	79	1	1	1
% 77	79	80	1	1	1
% 78	67	81	1	1	1
% 79	81	82	1	1	1
% 80	82	83	1	1	1
% 81	83	84	1	1	1
% 82	84	85	1	1	1
% 83	85	86	1	1	1
% 84	86	87	1	1	1
% 85	87	88	1	1	1
% 86	82	89	1	1	1
% 87	89	90	1	1	1
% 88	90	91	1	1	1
% 89	68	93	1	1	1
% 90	93	94	1	1	1
% 91	94	95	1	1	1
% 92	95	96	1	1	1
% 93	96	97	1	1	1
% 94	97	98	1	1	1
% 95	98	99	1	1	1
% 96	95	100	1	1	1
% 97	100	101	1	1	1
% 98	101	102	1	1	1
% 99	102	103	1	1	1
% 100	1	105	1	1	1
% 101	105	106	1	1	1
% 102	106	107	1	1	1
% 103	107	108	1	1	1
% 104	108	109	1	1	1
% 105	109	110	1	1	1
% 106	110	111	1	1	1
% 107	111	112	1	1	1
% 108	112	113	1	1	1
% 109	113	114	1	1	1
% 110	114	115	1	1	1
% 111	115	116	1	1	1
% 112	115	117	1	1	1
% 113	117	118	1	1	1
% 114	105	119	1	1	1
% 115	119	120	1	1	1
% 116	120	121	1	1	1
% 117	121	122	1	1	1
% 118	122	123	1	1	1
% 119	48	27	0	1	0% ok zhang 2007
% 120	17	27	0	1	0% ok zhang 2007
% 121	8	24	0	1	0% ok zhang 2007
% 122	56	45	0	1	0% ok zhang 2007
% 123	65	51	0	1	0% 123	65	56	0	1	0 
% 124	38	65	0	1	0% ok zhang 2007
% 125	9	42	0	1	0% ok zhang 2007
% 126	61	100	0	1	0% ok zhang 2007
% 127	76	95	0	1	0% ok zhang 2007
% 128	91	78	0	1	0% ok zhang 2007
% 129	103	80	0	1	0% ok zhang 2007
% 130	113	86	0	1	0% ok zhang 2007
% 131	110	89	0	1	0% ok zhang 2007
% 132	115	123	0	1	0% ok zhang 2007
% 133	25	36	0	1	0% ok zhang 2007

end