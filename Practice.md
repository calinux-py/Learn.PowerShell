```powershell
# If statements
$temp = 60

if ($temp -lt 50){
    Write-Host "It is cold"
} elseif ($temp -ge 50){
    Write-Host "It is hot"
} else {
    Write-Host "Nah"
}


# Switch statements
$day = "Tuesday"

switch ($day) {
    "Monday" { Write-Host "Today is Monday"}
    "Tuesday" { Write-Host "Today is Tuesday"}
}


# Comparisons
$a = 10
$b = 20

if ($a -eq $b) {
    Write-Host "a is euqal to b"
} elseif ($a -ne $b){
    Write-Host "a is not equal to b"
}

if ($a -gt $b){
    Write-Host "a is greater than b"
} elseif ($a -lt $b) {
    Write-Host "a is less than b"
}


if ($a -ge $b){
    Write-Host "a is greater than or euqal to b"
} elseif ($a -le $b){
    Write-Host "a is less than or equal to b"
}


# For Loop

for ($i = 1; $i -le 10; $i++) {
    Write-Host $i
}


# ForEach Loop

$fruits = @("apple", "banana", "grape")

foreach ($fruit in $fruits) {
    Write-Host $fruit
}


# Creating a Hash Table

$ages = @{
    "John" = 30
    "Sarah" = 25
    "Mike" = 40
}


# Accessing Hash Table Objects

$ages = @{
    "John" = 30
    "Sarah" = 25
    "Mike" = 40
}
$johnAge = $ages["John"]
Write-Host "John's age is $johnAge"
```


