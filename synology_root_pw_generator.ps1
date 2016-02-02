#synology telnet root password of the day
# tested on Synology DS212+
# 1 character = month in hex
# 2-3 			  = month in decimal (pad with zero)
# 4 			    = "-"
# 5-6 	 		  = day of month in hex (01,02 ... 1F)(pad with zero)
# 7-8			    = greatest common divisor between month an day in decimal (pad with zero)

function Get-GCD ($x, $y) {
  if ($y -eq 0) { $x } else { Get-GCD $y ($x%$y) }
}

$date = get-date
$month = $date.month
$day = $date.day
$gcd = Get-GCD $month $day

"{0:X}{0:D2}-{1:X2}{2:D2}" -f $month,$day,$gcd
