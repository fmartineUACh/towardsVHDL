begin_template Overall Structure

--  Module Declaration

    -- Port Declaration

    -- Reg Declaration (optional)

    -- Integer Declartion (optional)

    -- Wir Declartion (optional)

    -- Wand Declartion (optional)

    -- Wor Declartion (optional)

    -- Tri Declartion (optional)

    -- Parameter Declartion (optional)

    -- Function Declaration (optional)

    -- Task Declaration (optional)

    -- Module Instantiation (optional)

    -- Always Statement (optional)

       -- If Statement (optional)

       -- Case Statement (optional)

       -- Casex Statement (optional)

       -- Casez Statement (optional)

       -- For Statement (optional)

       -- While Statement (optional)

    -- Current Assignment Statement (optional)

end_template


begin_template Full Design: Counter
--Clearable loadable enableable counter
module __module_name (__data_input_name, __clk_input_name, __clrn_input_name,
                      __ena_input_name, __ld_input_name, __count_output_name);

   input [__data_name_msb:__data_name_lsb] __data_input_name;
   input __clk_input_name;
   input __clrn_input_name;
   input __ena_input_name;
   input __ld_input_name;
   output [__count_name_msb:__count_name_lsb] __count_output_name;

   reg  [__count_tmp_msb:__count_tmp_lsb] __count_tmp_name;
   always @(posedge __clk_input_name or posedge __clrn_input_name)
     begin
        if (__clrn_input_name)
            __count_tmp_name = 'b0;
        else if (__ld_input_name)
            __count_tmp_name = __data_input_name;
        else if (__ena_input_name)
            __count_tmp_name = __count_tmp_name + 'b1;
     end

   assign __count_output_name = __count_tmp_name;

endmodule
end_template


begin_template Always Statement
always @(__event-expression)
  begin

   -- Statement;

   -- Statement;

  end
end_template


begin_template Case Statement
case (__expression)
       __constant_value :
       begin
               __statement;
       end
       __constant_value :
       begin
               __statement;
       end
       default :
       begin
               __statement;
       end
endcase
end_template


begin_template Casex Statement
casex (__expression)
       __constant_value :
       begin
               __statement;
       end
       __constant_value :
       begin
               __statement;
       end
       default :
       begin
               __statement;
       end
endcase
end_template


begin_template Casez Statement
casez (__expression)
       __constant_value :
       begin
               __statement;
       end
       __constant_value :
       begin
               __statement;
       end
       default :
       begin
               __statement;
       end
endcase
end_template


begin_template Constant-Value Expression
assign __identify_name = (__op_name == __op_value) ? __value1 : __value2;
end_template


begin_template Current Assignment Statement
assign __identify_name = __value;
       __identify_name = __value;
end_template


begin_template For Statement
for (__index = __low_range; __index < __high_range; __index = __index + __step)
  begin
    __statement;
  end
end_template


begin_template Function Declaration
function [__range_msb:__range_lsb] __function_name;

  -- Input_port Declaration

  -- Reg Declaration

  -- Wire Declaration

  begin

    __statements;

  end

endfunction
end_template


begin_template If Statement
if (__expression)
  begin
    __statement;
  end
else if (__expression)
  begin
    __statement;
  end
else
  begin
    __statement;
  end
end_template


begin_template Integer Declaration
integer  __integer_name;
end_template


begin_template Module Declaration
module __module_name ( __input_name, __input_name,
                       __output_name, __output_name,
                       __inout_name, inout_name);
  -- Port Declaration

  -- Wire Declaration

  -- Integer Declaration

  -- Concurent Assignment

  -- Always Statement

endmodule
end_template


begin_template Logic Function (and)
and (__output_signal, __input_signal, __input_signal, ..);
end_template


begin_template Logic Function (nand)
nand (__output_signal, __input_signal, __input_signal, ..);
end_template


begin_template Logic Function (or)
or (__output_signal, __input_signal, __input_signal, ..);
end_template


begin_template Logic Function (nor)
nor (__output_signal, __input_signal, __input_signal, ..);
end_template


begin_template Logic Function (xor)
xor (__output_signal, __input_signal, __input_signal, ..);
end_template


begin_template Logic Function (xnor)
xnor (__output_signal, __input_signal, __input_signal, ..);
end_template


begin_template Logic Function (not)
not (__output_signal, __input_signal);
end_template


begin_template Logic Function (buf)
buf (__output_signal, __input_signal);
end_template


begin_template Module Instantiation
__module_name #(__parameter_value, __parameter_value) __instance_name
                               (.__module_port_name(__signal_name),
                               .__module_port_name(__signal_name),
                               .__module_port_name(__signal_name));
end_template


begin_template Port Declaration
input  __input_name;
input  [__input_range_msb:__input_range_lsb] __input_name;
output  __output_name;
inout  __inout_name;
end_template


begin_template Parameter Declaration
parameter __parameter_name = _parameter_value;
end_template


begin_template Register Declaration
reg  __register_name;
reg [__reg_range_msb:__reg_range_lsb] __register_name;
end_template


begin_template Supply0 Declaration
supply0  __gnd_name;
end_template


begin_template Supply1 Declaration
supply1  __power_name;
end_template


begin_template Task Statement
task  __task_name;

   -- Input_port Declaration

   -- Output_port Declaration

   -- Inout_port Declaration

   -- Reg Declaration

   -- Wire Declaration

  begin

    __statements;

  end
endtask
end_template


begin_template Tri Declaration
tri  __tri_name;
end_template


begin_template Wand Declaration
wand  __wand_name;
end_template


begin_template While Statement
while (__expression)
  begin
    __statement;

    __statement;
  end
end_template


begin_template Wire Declaration
wire  __wire_name;
wire  [__wire_range_msb:__wire_range_lsb] __wire_name;
end_template


begin_template Wor Declaration
wor  __wor_name;
end_template


