function mpc = DVLU10

%% MATPOWER Case Format : Version 2
mpc.version = '2';

%%-----  Power Flow Data  -----%%
%% system MVA base
mpc.baseMVA = 1;

%% bus data
%	bus_i	type	Pd	Qd	Gs	Bs	area	Vm	Va	baseKV	zone	Vmax	Vmin
mpc.bus = [
	100351862	3	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100351883	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100351890	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100351897	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100351904	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100351911	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100351918	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100351925	1	0.148107166	0.0431085845	0	0	0	1	0	13.8	0	1.1	0.9;
	100351932	1	0.199464979	0.0516495359	0	0	0	1	0	13.8	0	1.1	0.9;
	100351939	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100351946	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100351953	1	0.0921925881	0.0251012437	0	0	0	1	0	13.8	0	1.1	0.9;
	100351960	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100351967	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100351974	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100351981	1	0.158695853	0.0450469564	0	0	0	1	0	13.8	0	1.1	0.9;
	100351988	1	0.116259143	0.0274097908	0	0	0	1	0	13.8	0	1.1	0.9;
	100351995	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100352002	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100352009	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100352016	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100352023	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100352030	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100352037	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100352044	1	0.0756584656	0.0203091575	0	0	0	1	0	13.8	0	1.1	0.9;
	100352051	1	0.0872384839	0.0163280915	0	0	0	1	0	13.8	0	1.1	0.9;
	100352093	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100352100	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100352107	1	0.219338593	0.0254815146	0	0	0	1	0	13.8	0	1.1	0.9;
	100352114	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100352121	1	0.0132606733	0.0043747978	0	0	0	1	0	13.8	0	1.1	0.9;
	100352128	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100352135	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100352142	1	0.209898386	0.0641042487	0	0	0	1	0	13.8	0	1.1	0.9;
	100352149	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100352156	1	0.0834361999	0.0118287802	0	0	0	1	0	13.8	0	1.1	0.9;
	100352177	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100352184	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100352219	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100352233	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100352254	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100352261	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100352282	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100352289	1	0.141270347	0.0249430779	0	0	0	1	0	13.8	0	1.1	0.9;
	100352296	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100352303	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100352310	1	0.297510621	0.0504111316	0	0	0	1	0	13.8	0	1.1	0.9;
	100352331	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100352338	1	0.0818444861	0.0250181669	0	0	0	1	0	13.8	0	1.1	0.9;
	100353437	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100353444	1	0.015009042	0.00558628027	0	0	0	1	0	13.8	0	1.1	0.9;
	100353451	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100353458	1	0.00108499098	0.000403827489	0	0	0	1	0	13.8	0	1.1	0.9;
	100353465	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100353472	1	0.168457507	0.0439175198	0	0	0	1	0	13.8	0	1.1	0.9;
	100353479	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	100353486	1	0.439750461	0.13808636	0	0	0	1	0	13.8	0	1.1	0.9;
	128777679	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	128777686	1	0.10109089	0.0256093933	0	0	0	1	0	13.8	0	1.1	0.9;
	128777693	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	128777700	1	0.160732373	0.0229744189	0	0	0	1	0	13.8	0	1.1	0.9;
	128777707	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	131652089	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	148372038	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	148545143	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	148546767	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	148546768	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	149087205	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	149087268	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	149087269	1	0.109177611	0.0214095874	0	0	0	1	0	13.8	0	1.1	0.9;
	149087270	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	149087271	1	0.145470363	0.0353180792	0	0	0	1	0	13.8	0	1.1	0.9;
	149087272	1	0.147245267	0.0487958216	0	0	0	1	0	13.8	0	1.1	0.9;
	149087273	1	0.117353962	0.0188452828	0	0	0	1	0	13.8	0	1.1	0.9;
	149087274	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	149272750	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	149272752	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	149272753	1	0.164195302	0.06111256	0	0	0	1	0	13.8	0	1.1	0.9;
	150340885	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	150340886	1	0.0588065114	0.0218874499	0	0	0	1	0	13.8	0	1.1	0.9;
	150537288	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	150537289	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	150537292	1	0.178681308	0.045275792	0	0	0	1	0	13.8	0	1.1	0.9;
	150537293	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	150537294	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	150537295	1	0.0887884289	0.0330465495	0	0	0	1	0	13.8	0	1.1	0.9;
	151266382	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	2029100	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
	2391098	1	0	0	0	0	0	1	0	13.8	0	1.1	0.9;
];

%% generator data
%	bus	Pg	Qg	Qmax	Qmin	Vg	mBase	status	Pmax	Pmin	Pc1	Pc2	Qc1min	Qc1max	Qc2min	Qc2max	ramp_agc	ramp_10	ramp_30	ramp_q	apf
mpc.gen = [
	100351862	5	0	2.5	-2.5	1	1	1	10	5	0	0	0	0	0	0	0	0	0	0	0;
];

%% branch data
%	fbus	tbus	r	x	b	rateA	rateB	rateC	ratio	angle	status	angmin	angmax
mpc.branch = [
	100351897	100351904	6.50330997e-05	8.22104982e-05	-2.62549884e-09	0.0025944	0.0038916	0.0043332	1	0	1	-360	360;
	100351904	100351911	6.39931836e-05	8.08959058e-05	-2.62549884e-09	0.0025944	0.0038916	0.0043332	1	0	1	-360	360;
	100351911	100351925	4.50177708e-05	5.69084571e-05	-2.62549884e-09	0.0025944	0.0038916	0.0043332	1	0	1	-360	360;
	100351911	100351918	0.000471199164	0.00059565849	-2.62549884e-09	0.0025944	0.0038916	0.0043332	1	0	1	-360	360;
	100351918	100351953	0.00010682412	4.40356935e-05	-2.62549884e-09	0.001863	0.0028014	0.003105	1	0	1	-360	360;
	100351918	100351939	0.000169722448	0.000214551775	-2.62549884e-09	0.0025944	0.0038916	0.0043332	1	0	1	-360	360;
	100351918	100351932	0.00013137842	5.41576175e-05	-2.62549884e-09	0.001863	0.0028014	0.003105	1	0	1	-360	360;
	100351932	100351960	0.000276339918	0.000113914535	-2.62549884e-09	0.001863	0.0028014	0.003105	1	0	1	-360	360;
	100351890	100351897	2.62549884e-07	2.62549884e-07	-2.62549884e-09	6	8	10	1	0	1	-360	360;
	100351939	100351946	2.62549884e-07	2.62549884e-07	-2.62549884e-09	6	8	10	1	0	1	-360	360;
	100351967	100351974	0.000326916949	0.000365656952	-2.62549884e-09	0.0006624	0.0013662	0.0015318	1	0	1	-360	360;
	100351974	100351988	0.000637076307	0.000712570521	-2.62549884e-09	0.0006624	0.0013662	0.0015318	1	0	1	-360	360;
	100351974	100351981	0.000923540072	0.00103298054	-2.62549884e-09	0.0006624	0.0013662	0.0015318	1	0	1	-360	360;
	100351960	100351967	2.62549884e-07	2.62549884e-07	-2.62549884e-09	6	8	10	1	0	1	-360	360;
	100351946	100351995	4.22965576e-05	5.34684813e-05	-2.62549884e-09	0.0025944	0.0038916	0.0043332	1	0	1	-360	360;
	100351995	100352002	1.42848812e-05	1.80579921e-05	-2.62549884e-09	0.0025944	0.0038916	0.0043332	1	0	1	-360	360;
	100352009	100352016	0.000125204213	0.000158274798	-2.62549884e-09	0.0025944	0.0038916	0.0043332	1	0	1	-360	360;
	100352016	100352030	0.000111154269	0.000140513798	-2.62549884e-09	0.0025944	0.0038916	0.0043332	1	0	1	-360	360;
	100352016	100352023	0.000332970509	0.000372427865	-2.62549884e-09	0.0006624	0.0013662	0.0015318	1	0	1	-360	360;
	100352002	100352009	2.62549884e-07	2.62549884e-07	-2.62549884e-09	6	8	10	1	0	1	-360	360;
	100352037	100352044	0.00134154691	0.00150052163	-2.62549884e-09	0.0006624	0.0013662	0.0015318	1	0	1	-360	360;
	100352044	100352051	0.000699035354	0.000307451528	-2.62549884e-09	0.0012282	0.0018492	0.0020562	1	0	1	-360	360;
	100352023	100352037	2.62549884e-07	2.62549884e-07	-2.62549884e-09	6	8	10	1	0	1	-360	360;
	100352100	100352107	0.000252661536	0.000350871392	-2.62549884e-09	0.002622	0.0039468	0.0043884	1	0	1	-360	360;
	100352107	100352114	0.000175631296	0.000243899402	-2.62549884e-09	0.002622	0.0039468	0.0043884	1	0	1	-360	360;
	100352114	100352128	0.00010092958	0.000140161034	-2.62549884e-09	0.002622	0.0039468	0.0043884	1	0	1	-360	360;
	100352114	100352121	0.000411332477	0.00046007581	-2.62549884e-09	0.0006624	0.0013662	0.0015318	1	0	1	-360	360;
	100352128	100352135	8.02868739e-05	0.0001014933	-2.62549884e-09	0.0025944	0.0038916	0.0043332	1	0	1	-360	360;
	100352135	100352156	0.000159816084	6.58803657e-05	-2.62549884e-09	0.001863	0.0028014	0.003105	1	0	1	-360	360;
	100352135	100352149	6.61849339e-05	8.366657e-05	-2.62549884e-09	0.0025944	0.0038916	0.0043332	1	0	1	-360	360;
	100352135	100352142	0.000510506042	0.00021044393	-2.62549884e-09	0.001863	0.0028014	0.003105	1	0	1	-360	360;
	100352093	100352100	2.62549884e-07	2.62549884e-07	-2.62549884e-09	6	8	10	1	0	1	-360	360;
	100352282	100352289	0.000298429085	0.000123020267	-2.62549884e-09	0.001863	0.0028014	0.003105	1	0	1	-360	360;
	100352289	100352296	0.000110500387	4.55511468e-05	-2.62549884e-09	0.001863	0.0028014	0.003105	1	0	1	-360	360;
	100352296	100352310	0.000101913307	4.20113279e-05	-2.62549884e-09	0.001863	0.0028014	0.003105	1	0	1	-360	360;
	100352296	100352303	0.000274042357	0.00011296742	-2.62549884e-09	0.001863	0.0028014	0.003105	1	0	1	-360	360;
	100352233	100352282	2.62549884e-07	2.62549884e-07	-2.62549884e-09	6	8	10	1	0	1	-360	360;
	100352331	100352338	7.12748365e-05	2.938135e-05	-2.62549884e-09	0.001863	0.0028014	0.003105	1	0	1	-360	360;
	100352261	100352331	2.62549884e-07	2.62549884e-07	-2.62549884e-09	6	8	10	1	0	1	-360	360;
	100353437	100353444	6.3203985e-05	2.60543341e-05	-2.62549884e-09	0.001863	0.0028014	0.003105	1	0	1	-360	360;
	100352219	100353437	2.62549884e-07	2.62549884e-07	-2.62549884e-09	6	8	10	1	0	1	-360	360;
	100353451	100353458	0.000516452768	0.000212895326	-2.62549884e-09	0.001863	0.0028014	0.003105	1	0	1	-360	360;
	100351995	100353451	2.62549884e-07	2.62549884e-07	-2.62549884e-09	6	8	10	1	0	1	-360	360;
	100353465	100353472	6.41667168e-05	1.13970081e-05	-2.62549884e-09	0.001449	0.0021666	0.002415	1	0	1	-360	360;
	100351904	100353465	2.62549884e-07	2.62549884e-07	-2.62549884e-09	6	8	10	1	0	1	-360	360;
	100353479	100353486	5.87542289e-05	2.42200284e-05	-2.62549884e-09	0.001863	0.0028014	0.003105	1	0	1	-360	360;
	100351883	100353479	2.62549884e-07	2.62549884e-07	-2.62549884e-09	6	8	10	1	0	1	-360	360;
	128777679	128777686	0.000110397225	0.000139556793	-2.62549884e-09	0.0025944	0.0038916	0.0043332	1	0	1	-360	360;
	128777686	128777693	0.000185736644	0.000234795851	-2.62549884e-09	0.0025944	0.0038916	0.0043332	1	0	1	-360	360;
	128777693	128777700	0.000209818962	0.000265239109	-2.62549884e-09	0.0025944	0.0038916	0.0043332	1	0	1	-360	360;
	128777693	2029100	2.32270326e-05	2.93620622e-05	-2.62549884e-09	0.0025944	0.0038916	0.0043332	1	0	1	-360	360;
	128777700	128777707	0.000120771524	0.000152671289	-2.62549884e-09	0.0025944	0.0038916	0.0043332	1	0	1	-360	360;
	128777707	100352093	0.000253011462	0.000267460476	-2.62549884e-09	0.0037812	0.005658	0.0062928	1	0	1	-360	360;
	100352030	128777679	2.62549884e-07	2.62549884e-07	-2.62549884e-09	6	8	10	1	0	1	-360	360;
	100351862	148372038	1.57722609e-05	1.66729853e-05	-2.62549884e-09	0.0037812	0.005658	0.0062928	1	0	1	-360	360;
	148372038	131652089	2.62549884e-07	2.62549884e-07	-2.62549884e-09	6	8	10	1	0	1	-360	360;
	148546767	148546768	0.000275528407	0.000138417114	-2.62549884e-09	0.0031878	0.0047886	0.0053268	1	0	1	-360	360;
	148546768	100351883	2.17328267e-05	2.2973948e-05	-2.62549884e-09	0.0037812	0.005658	0.0062928	1	0	1	-360	360;
	100351883	100351890	0.00019006223	0.000200916331	-2.62549884e-09	0.0037812	0.005658	0.0062928	1	0	1	-360	360;
	148545143	148546767	2.62549884e-07	2.62549884e-07	-2.62549884e-09	6	8	10	1	0	1	-360	360;
	149087268	149087269	4.38698024e-05	4.63751252e-05	-2.62549884e-09	0.0037812	0.005658	0.0062928	1	0	1	-360	360;
	149087269	100352219	2.62515479e-05	2.7750725e-05	-2.62549884e-09	0.0037812	0.005658	0.0062928	1	0	1	-360	360;
	100352219	149087270	6.96966522e-05	7.36768984e-05	-2.62549884e-09	0.0037812	0.005658	0.0062928	1	0	1	-360	360;
	149087270	149087272	9.59743369e-05	0.000101455253	-2.62549884e-09	0.0037812	0.005658	0.0062928	1	0	1	-360	360;
	149087270	149087271	5.87002416e-05	6.20525033e-05	-2.62549884e-09	0.0037812	0.005658	0.0062928	1	0	1	-360	360;
	149087270	100352233	5.12885225e-05	5.42175147e-05	-2.62549884e-09	0.0037812	0.005658	0.0062928	1	0	1	-360	360;
	149087271	100352261	0.000223943888	0.000236732907	-2.62549884e-09	0.0037812	0.005658	0.0062928	1	0	1	-360	360;
	100352261	149087273	4.40800252e-05	4.65973535e-05	-2.62549884e-09	0.0037812	0.005658	0.0062928	1	0	1	-360	360;
	149087273	149087274	2.59294266e-05	2.74102079e-05	-2.62549884e-09	0.0037812	0.005658	0.0062928	1	0	1	-360	360;
	149087272	100352254	3.50047259e-05	3.70037807e-05	-2.62549884e-09	0.0037812	0.005658	0.0062928	1	0	1	-360	360;
	100352184	149087268	2.62549884e-07	2.62549884e-07	-2.62549884e-09	6	8	10	1	0	1	-360	360;
	149087274	149087205	2.62549884e-07	2.62549884e-07	-2.62549884e-09	6	8	10	1	0	1	-360	360;
	149272752	149272753	4.07201207e-05	7.23252752e-06	-2.62549884e-09	0.001449	0.0021666	0.002415	1	0	1	-360	360;
	149272750	149272752	2.62549884e-07	2.62549884e-07	-2.62549884e-09	6	8	10	1	0	1	-360	360;
	150340885	150340886	6.20356261e-05	1.04395225e-05	-2.62549884e-09	0.0011178	0.0016836	0.0018768	1	0	1	-360	360;
	100352303	150340885	2.62549884e-07	2.62549884e-07	-2.62549884e-09	6	8	10	1	0	1	-360	360;
	150537288	150537289	0.000107991072	0.000143795779	-2.62549884e-09	0.002691	0.0040296	0.004485	1	0	1	-360	360;
	150537289	150537292	4.30967165e-05	4.55578899e-05	-2.62549884e-09	0.0037812	0.005658	0.0062928	1	0	1	-360	360;
	150537289	100352184	4.77143066e-05	5.04391819e-05	-2.62549884e-09	0.0037812	0.005658	0.0062928	1	0	1	-360	360;
	150537289	100352177	1.58512523e-05	2.11067744e-05	-2.62549884e-09	0.002691	0.0040296	0.004485	1	0	1	-360	360;
	150537292	149272750	1.5174808e-05	1.6041413e-05	-2.62549884e-09	0.0037812	0.005658	0.0062928	1	0	1	-360	360;
	149272750	150537293	1.88769078e-05	1.99549329e-05	-2.62549884e-09	0.0037812	0.005658	0.0062928	1	0	1	-360	360;
	150537293	150537295	6.60039908e-05	2.72085696e-05	-2.62549884e-09	0.001863	0.0028014	0.003105	1	0	1	-360	360;
	150537293	150537294	5.08616463e-05	5.37662604e-05	-2.62549884e-09	0.0037812	0.005658	0.0062928	1	0	1	-360	360;
	100352149	150537288	2.62549884e-07	2.62549884e-07	-2.62549884e-09	6	8	10	1	0	1	-360	360;
	150537294	2391098	2.62549884e-07	2.62549884e-07	-2.62549884e-09	6	8	10	1	0	1	-360	360;
	131652089	151266382	0.000238458541	0.000119794338	-2.62549884e-09	0.0031878	0.0047886	0.0053268	1	0	1	-360	360;
	131652089	148545143	0.000268099155	0.000134684884	-2.62549884e-09	0.0031878	0.0047886	0.0053268	1	0	1	-360	360;
];

%%-----  OPF Data  -----%%
%% generator cost data
%	1	startup	shutdown	n	x1	y1	...	xn	yn
%	2	startup	shutdown	n	c(n-1)	...	c0
mpc.gencost = [
	2	0	0	3	0.25	20	0;
];