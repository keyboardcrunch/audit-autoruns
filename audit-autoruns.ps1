Param (
	[Parameter(Mandatory = $true)]
	[String]$AutorunCSV,
	[int]$Days = 30,
	[int]$Previous = -1
)

$Data = Get-Content -Path $AutorunCSV | ConvertFrom-Csv
$Date = Get-Date

foreach ($item in $data)
{
	Try
	{
		$Changed = New-TimeSpan -Start $item.Time -End $Date -ErrorAction SilentlyContinue
		If ($Changed.Days -lt $Previous)
		{
			# Anything set to previous date (win binaries/services)
		}
		elseif ($Changed.Days -lt $Days)
		{
			Write-Output $item
		}
		Else
		{
			# Anything not set to previous date (win binaries/services) and not changed within last 30 days
		}
	}
	Catch
	{
		# we're ignoring any failures of new-timespan to parse date	(ErrorAction isn't escaping error)
	}
}
