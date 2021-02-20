/* Quartus II Version 9.0 Build 132 02/25/2009 SJ Full Version */
JedecChain;
	FileRevision(JESD32A);
	DefaultMfr(6E);

	P ActionCode(Cfg)
		Device PartName(EPC4) Path("C:/Users/Budkova/Documents/Quartus/stand_test/output_files/") File("output_file.pof") MfrSpec(OpMask(1));
	P ActionCode(Ign)
		Device PartName(EPF10K200SR240) MfrSpec(OpMask(0) FullPath("C:/Users/Budkova/Documents/Quartus/stand_test/output_files/stand_test.sof"));

ChainEnd;

AlteraBegin;
	ChainType(JTAG);
AlteraEnd;
