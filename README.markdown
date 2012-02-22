# battery-prompt.sh

Display laptop battery life (in percentage) in bash prompt.

If the laptop is on AC power, the battery life is display without color.

If the laptop is running on battery power, it is displayed in color:

* Green, if life is >= 75%
* Yellow, if life is between 75% and 25% (both excluded)
* Red, if life is 25% or below.

## Dependencies

* acpi 
