function [bus,branch,chaves]  = Sis_33bus()

% No	Tipo	Vpu	Teta	Pcarga	Qcarga	Pger	Qger
bus = [
1	3	12.66	0	0	0	0	0
2	1	12.66	0	100	60	0	0
3	1	12.66	0	90	40	0	0
4	1	12.66	0	120	80	0	0
5	1	12.66	0	60	30	0	0
6	1	12.66	0	60	20	0	0
7	1	12.66	0	200	100	0	0
8	1	12.66	0	200	100	0	0
9	1	12.66	0	60	20	0	0
10	1	12.66	0	60	20	0	0
11	1	12.66	0	45	30	0	0
12	1	12.66	0	60	35	0	0
13	1	12.66	0	60	35	0	0
14	1	12.66	0	120	80	0	0
15	1	12.66	0	60	10	0	0
16	1	12.66	0	60	20	0	0
17	1	12.66	0	60	20	0	0
18	1	12.66	0	90	40	0	0
19	1	12.66	0	90	40	0	0
20	1	12.66	0	90	40	0	0
21	1	12.66	0	90	40	0	0
22	1	12.66	0	90	40	0	0
23	1	12.66	0	90	50	0	0
24	1	12.66	0	420	200	0	0
25	1	12.66	0	420	200	0	0
26	1	12.66	0	60	25	0	0
27	1	12.66	0	60	25	0	0
28	1	12.66	0	60	20	0	0
29	1	12.66	0	120	70	0	0
30	1	12.66	0	200	600	0	0
31	1	12.66	0	150	70	0	0
32	1	12.66	0	210	100	0	0
33	1	12.66	0	60	40	0	0
];

% De	Para	R(ohm)	X(ohm)	Comprimento(km)	Ampacidade(A)
branch = [
1	2	0.0922	0.047	1	100
2	3	0.493	0.2512	1	100
3	4	0.3661	0.1864	1	100
4	5	0.3811	0.1941	1	100
5	6	0.819	0.707	1	100
6	7	0.1872	0.6188	1	100
7	8	0.7115	0.2351	1	100
8	9	1.0299	0.74	1	100
9	10	1.044	0.74	1	100
10	11	0.1967	0.0651	1	100
11	12	0.3744	0.1298	1	100
12	13	1.468	1.1549	1	100
13	14	0.5416	0.7129	1	100
14	15	0.5909	0.526	1	100
15	16	0.7462	0.5449	1	100
16	17	1.2889	1.721	1	100
17	18	0.732	0.5739	1	100
2	19	0.164	0.1565	1	100
19	20	1.5042	1.3555	1	100
20	21	0.4095	0.4784	1	100
21	22	0.7089	0.9373	1	100
3	23	0.4512	0.3084	1	100
23	24	0.898	0.7091	1	100
24	25	0.8959	0.7071	1	100
6	26	0.2031	0.1034	1	100
26	27	0.2842	0.1447	1	100
27	28	1.0589	0.9338	1	100
28	29	0.8043	0.7006	1	100
29	30	0.5074	0.2585	1	100
30	31	0.9745	0.9629	1	100
31	32	0.3105	0.3619	1	100
32	33	0.3411	0.5302	1	100
8	21	2	2	1	100
9	15	2	2	1	100
12	22	2	2	1	100
18	33	0.5	0.5	1	100
25	29	0.5	0.5	1	100
];

% IdLinha	No_Emissor	No_Receptor		Tipo		Operacional			Estado
%                                       (NA=1/NF=0)	(0-inativo,1-ativo)	(0-aberta,1-fechada)
chaves = [
1	1	2	1	0	1
2	2	3	1	1	1
3	3	4	1	1	1
4	4	5	1	1	1
5	5	6	1	1	1
6	6	7	1	1	1
7	7	8	1	1	1
8	8	9	1	1	1
9	9	10	1	1	1
10	10	11	1	1	1
11	11	12	1	1	1
12	12	13	1	1	1
13	13	14	1	1	1
14	14	15	1	1	1
15	15	16	1	1	1
16	16	17	1	1	1
17	17	18	1	1	1
18	2	19	1	1	1
19	19	20	1	1	1
20	20	21	1	1	1
21	21	22	1	1	1
22	3	23	1	1	1
23	23	24	1	1	1
24	24	25	1	1	1
25	6	26	1	1	1
26	26	27	1	1	1
27	27	28	1	1	1
28	28	29	1	1	1
29	29	30	1	1	1
30	30	31	1	1	1
31	31	32	1	1	1
32	32	33	1	1	1
33	8	21	1	1	0
34	9	15	1	1	0
35	12	22	1	1	0
36	18	33	1	1	0
37	25	29	1	1	0
];

end