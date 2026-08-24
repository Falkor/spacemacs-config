-- -*- mode: vhdl; -*-
-- `(file-name-nondirectory (file-name-sans-extension (buffer-file-name)))`.vhd
-- ------------------------------------------------------------------------------
-- Gaisler-type programming template

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- ------------------------------------
-- ------- Package Declaration --------
-- ------------------------------------
package ${1:name}_pkg is
  -- UART signal state
  type uart_state_type is (idle, start, bits, parity, stop);

  -- quotient of euclidian division
  function log2(n: natural) return natural;

  -- pragma translate_off
  -- write something to the console (without flushing the line)
  procedure echo(arg : in string := ""; arg1 : in string := "");
  -- write something to the console & flush the line
  --procedure echol(arg : in string := "");
  procedure echol(arg0 : in string := ""; arg1 : in string := "");
  -- write hexadecimal value to the console (without flushing the line)
  procedure hex_echo(value: in std_logic_vector);
  -- write hexadecimal value to the console & flush the line
  procedure hex_echol(value: in std_logic_vector);
-- pragma translate_on
end package ${1}_pkg;

-- ----------------------------
package body ${1}_pkg is
  -- log2()
  function log2(n : natural) return natural is
  begin
    assert (n <= 2147483647)
      report "misuse of log2 function: this function only supports < 2^31 integers"
      severity failure;
    for i in 0 to 30 loop -- works for 32-bit integers
      if (2**i > n) then return i; end if;
    end loop;
    return (30);
  end function log2;
  -- -- old version (from scratch yesterday)
  -- function log2(n: positive) return natural is
  --   variable res: natural := 1;
  -- begin
  --   while (n >= (2**res)) loop
  --     res := res +  1;
  --   end loop;
  --   return res;
  -- end function log2;

  function is_not_a_multiple_of_four(i : natural) return natural is
  begin
    if (i mod 4) = 0 then
      return 0;
    else
      return 1;
    end if;
  end function is_not_a_multiple_of_four;

  -- pragma translate_off
  -- write something to the console (without flushing the line)
  procedure echo(arg : in string := ""; arg1 : in string := "") is
  begin
    std.textio.write(std.textio.output, arg & arg1);
  end procedure echo;

  procedure echo_time is
    variable vns, vms, vus : integer;
  begin
    vns := integer(now / 1 ns);
    vms := vns / 1_000_000;
    --if (vms < 10) then
    --  std.textio.write(std.textio.output, "  ");
    --elsif (vms < 100) then
    --  std.textio.write(std.textio.output, " ");
    --end if;
    std.textio.write(std.textio.output, integer'image(vms));
    std.textio.write(std.textio.output, string'(" ms "));
    vus := (vns / 1_000) mod 1000;
    if (vus < 10) then
      std.textio.write(std.textio.output, "  ");
    elsif (vus < 100) then
      std.textio.write(std.textio.output, " ");
    end if;
    std.textio.write(std.textio.output, integer'image(vus));
    std.textio.write(std.textio.output, string'(" us "));
    vns := vns mod 1000;
    if (vns < 10) then
      std.textio.write(std.textio.output, "  ");
    elsif (vns < 100) then
      std.textio.write(std.textio.output, " ");
    end if;
    std.textio.write(std.textio.output, integer'image(vns));
    std.textio.write(std.textio.output, string'(" ns"));
  end procedure;

  -- write something to the console & flush the line
  procedure echol(arg0 : in string := ""; arg1 : in string := "") is
  begin
    std.textio.write(std.textio.output, arg0);
    std.textio.write(std.textio.output, ": (");
    echo_time;
    std.textio.write(std.textio.output, ") ");
    std.textio.write(std.textio.output, arg1 & LF);
  end procedure echol;

  -- write hexadecimal value to the console (without flushing the line)
  procedure hex_echo(value: in std_logic_vector) is
    variable tmp : std_logic_vector(
      value'length + (4 * is_not_a_multiple_of_four(value'length)) - 1 downto 0)
        := (others => '0');
    variable start_ndx : natural;
    variable ndx : integer;
    variable str : string(1 to (tmp'length/4));
    variable i : natural;
    variable nibble : std_logic_vector(3 downto 0);
  begin
    -- set starting index (always a multiple-of-4 minus 1, e.g 7 or 15)
    if value'length mod 4 = 0 then
      start_ndx := value'length - 1;
    else
      start_ndx := value'length - 1 + (4 - value'length mod 4);
    end if;
    -- init meaning bits of tmp
    tmp(value'length - 1 downto 0) := value;
    -- now simply write heax characters nibble by nibble starting from
    -- start_ndx and proceeding to the right
    ndx := start_ndx;
    i := 1;
    while ndx > 0 loop
      nibble := to_X01(tmp(ndx downto ndx - 3));
      case nibble is
        when x"0" => str(i) := '0';
        when x"1" => str(i) := '1';
        when x"2" => str(i) := '2';
        when x"3" => str(i) := '3';
        when x"4" => str(i) := '4';
        when x"5" => str(i) := '5';
        when x"6" => str(i) := '6';
        when x"7" => str(i) := '7';
        when x"8" => str(i) := '8';
        when x"9" => str(i) := '9';
        when x"a" => str(i) := 'a';
        when x"b" => str(i) := 'b';
        when x"c" => str(i) := 'c';
        when x"d" => str(i) := 'd';
        when x"e" => str(i) := 'e';
        when x"f" => str(i) := 'f';
        when others => str(i) := 'X';
      end case;
      ndx := ndx - 4;
      i := i + 1;
    end loop;
    std.textio.write(std.textio.output, str);
  end procedure hex_echo;

  -- write hexadecimal value to the console & flush the line
  procedure hex_echol(value: in std_logic_vector) is
    variable tmp : std_logic_vector(
      value'length + (4 * is_not_a_multiple_of_four(value'length)) - 1 downto 0)
        := (others => '0');
    variable start_ndx : natural;
    variable ndx : integer;
    variable str : string(1 to (tmp'length/4));
    variable i : natural;
    variable nibble : std_logic_vector(3 downto 0);
  begin
    -- set starting index (always a multiple-of-4 minus 1, e.g 7 or 15)
    if value'length mod 4 = 0 then
      start_ndx := value'length - 1;
    else
      start_ndx := value'length - 1 + (4 - value'length mod 4);
    end if;
    -- init meaning bits of tmp
    tmp(value'length - 1 downto 0) := value;
    -- now simply write heax characters nibble by nibble starting from
    -- start_ndx and proceeding to the right
    ndx := start_ndx;
    i := 1;
    while ndx > 0 loop
      nibble := to_X01(tmp(ndx downto ndx - 3));
      case nibble is
        when x"0" => str(i) := '0';
        when x"1" => str(i) := '1';
        when x"2" => str(i) := '2';
        when x"3" => str(i) := '3';
        when x"4" => str(i) := '4';
        when x"5" => str(i) := '5';
        when x"6" => str(i) := '6';
        when x"7" => str(i) := '7';
        when x"8" => str(i) := '8';
        when x"9" => str(i) := '9';
        when x"a" => str(i) := 'a';
        when x"b" => str(i) := 'b';
        when x"c" => str(i) := 'c';
        when x"d" => str(i) := 'd';
        when x"e" => str(i) := 'e';
        when x"f" => str(i) := 'f';
        when others => str(i) := 'X';
      end case;
      ndx := ndx - 4;
      i := i + 1;
    end loop;
    std.textio.write(std.textio.output, str & LF);
  end procedure hex_echol;
  -- pragma translate_on

end package body $1;
