Add-Type -TypeDefinition @"
public class SimpleMath
{
    public int Add(int a, int b)
    {
        return a + b;
    }
}
"@ -Language CSharp

# Erstelle ein Objekt der Klasse und rufe die Methode auf
$math = New-Object SimpleMath
$result = $math.Add(5, 7)

# Ergebnis ausgeben
Write-Host "Das Ergebnis ist: $result"