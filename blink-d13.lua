rs232 = require("luars232")

function sleep(s)
  local ntime = os.time() + s
  repeat until os.time() > ntime
end

port_name = "/dev/ttyS0"
local out = io.stderr

-- open port
local e, p = rs232.open(port_name)
if e ~= rs232.RS232_ERR_NOERROR then
	-- handle error
	out:write(string.format("can't open serial port '%s', error: '%s'\n",
			port_name, rs232.error_tostring(e)))
	return
end

-- set port settings
assert(p:set_baud_rate(rs232.RS232_BAUD_57600) == rs232.RS232_ERR_NOERROR)

-- out:write(string.format("OK, port open with values '%s'\n", tostring(p)))

while (true)
do 
  err, len_written = p:write("1")
  assert(e == rs232.RS232_ERR_NOERROR)
  sleep(0.5)
  err, len_written = p:write("0")
  assert(e == rs232.RS232_ERR_NOERROR)
  sleep(0.5)
end
