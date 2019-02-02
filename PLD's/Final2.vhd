entity my_design is port(
	mem_op, io_op:	in bit;
	read, write:	in bit;
	memr, memw:		out bit;
	io_rd, io_wr:	out bit);
end my_design;

architecture control of my_design is
begin
	memw  <= mem_op and write;
	memr  <= mem_op and read;
	io_wr <= io_op and write;
	io_rd <= io_op and read;
end control;

