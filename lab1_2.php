<?php
$sum = 0;
for($i=1; $i<11; $i++) 
{
$arr[$i] = rand(1,10);
$sum += pow($arr[$i], 2);
}
print_r ($arr);
echo "summa qvadratov  = " . $sum . "\n";
?>