-- -*- mode: vhdl; -*-
-- `(file-name-nondirectory (file-name-sans-extension (buffer-file-name)))`.vhd
-- ------------------------------------------------------------------------------
-- Gaisler-type programming template

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- -----------------------------------
-- ------- Entity Declaration --------
-- -----------------------------------
entity ${1:blocname} is
  -- generic();
  port(clk : in std_logic;
       rst : in std_logic; -- synchronous reset
       ${2:input} : in std_logic; -- input
       ${3:datain} : in std_logic_vector(7 downto 0); -- data input
       ${4:dataout} : out std_logic -- data output
       );
end entity $1;


-- ----------------------------------------
-- ------- Architecture Declaration -------
-- ----------------------------------------
-- Corresponding RTL for the entity $2
architecture rtl of $1 is
  -- constant ...

  -- type record (equivalent of C struct) to aggregate all registers
  type reg_type is record
    x: std_logic;
    y: std_logic;
  end record;

  -- all register output/input signals
  signal r:   reg_type;
  signal rin: reg_type;

begin -- start architecture body
  -- Pure sequential process (depending on clk)
  regs : process(clk)
  begin
    if rising_edge(clk) then
      r <= rin;
    end if;
  end process regs;

  -- Pure combinatorial process which implements the full logic
  --                  _________________________________________
  --                 /     __________________                  \
  --               r.x   / comb:F(r,inputs) \__                |
  --  rin.y          \->|                       \         +--+ |
  --    |  regs     /-->| evaluate v.x from r.* |->rin.x->|  |-+-r.x->
  --    |  +--+     |   \_______________________/         |> |
  --    +->|  |-r.y-/    v.x=r.x [...] rin.x <= v.x       +--+
  --       |> |          (begin)            (end)         regs
  --       +--+
  --
  -- comb: process (r, rst, ...) -- sensitivity list (NOT clk)
  comb: process (all) -- VHDL 2008 addition
    variable v: reg_type;

  begin
    -- Consistent start; initialize v
    v := r;

    -- Here: start implementing v :=F(r, [inputs])
    $0

    -- Consistent ending
    rin <= v;
  end process comb;

  -- drive outputs
  $3 <= r.y;

end architecture rtl;
