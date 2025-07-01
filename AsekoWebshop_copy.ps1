Add-Type -AssemblyName PresentationFramework

## Title="MainWindow" Height="500" Width="1200">
[xml]$xaml = @"
<Window 
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Änderungsdetails von Personen" Height="660" Width="1180" WindowStyle="None" AllowsTransparency="True" Background="Transparent" >

    <Border Background="#FFD8E5E6" CornerRadius="20" BorderBrush="Gray" BorderThickness="2">

        <Grid x:Name="grdShop" Height="527" Margin="0,60,0,0">
            <TextBox x:Name="txtVorname" HorizontalAlignment="Left" Margin="189,80,0,0" Text="Vorname" TextWrapping="Wrap" VerticalAlignment="Top" Width="120" Height="22" Background="#FFA6CDD1"/>
            <TextBox x:Name="txtNachname" HorizontalAlignment="Left" Margin="189,130,0,0" Text="Nachname" TextWrapping="Wrap" VerticalAlignment="Top" Width="120" Height="22" Background="#FFA6CDD1"/>
            <TextBox x:Name="txtUCCClient" Visibility="Hidden" HorizontalAlignment="Left" Margin="189,187,0,0" Text="UCCClient" TextWrapping="Wrap" VerticalAlignment="Top" Width="120" Height="22"/>
            <TextBox x:Name="txtUsername" HorizontalAlignment="Left" Margin="189,247,0,0" Text="Username" TextWrapping="Wrap" VerticalAlignment="Top" Width="120" Height="22" Background="#FFA6CDD1"/>
            <Label x:Name="lblVorname" Content="Vorname" HorizontalAlignment="Left" Margin="81,76,0,0" VerticalAlignment="Top" Width="118" Height="30"/>
            <Label x:Name="lblNachname" Content="Nachname" HorizontalAlignment="Left" Margin="81,124,0,0" VerticalAlignment="Top" Width="118" Height="31"/>
            <Label x:Name="lblUCCClient" Visibility="Hidden" Content="UccClient" HorizontalAlignment="Left" Margin="81,183,0,0" VerticalAlignment="Top" Width="118" Height="28"/>
            <Label x:Name="lblUsername" Content="Username" HorizontalAlignment="Left" Margin="81,242,0,0" VerticalAlignment="Top" Width="118" Height="31"/>
            <Button x:Name="btnSynchro" Content="Synchro" HorizontalAlignment="Left" Margin="98,489,0,0" VerticalAlignment="Top" Height="28" Width="84"  Foreground="#FF071885">
                <Button.Background>
                    <LinearGradientBrush EndPoint="0.5,1" StartPoint="0.5,0">
                        <GradientStop Color="Black" Offset="1"/>
                        <GradientStop Color="White" Offset="0"/>
                        <GradientStop Color="#FFD9DE62" Offset="0.918"/>
                    </LinearGradientBrush>
                </Button.Background>
                <Button.Style>
                    <Style TargetType="Button">
                        <Setter Property="Template">
                            <Setter.Value>
                                <ControlTemplate TargetType="Button">
                                    <Border Background="{TemplateBinding Background}" 
                                CornerRadius="20" 
                                BorderBrush="{TemplateBinding BorderBrush}" 
                                BorderThickness="{TemplateBinding BorderThickness}">
                                        <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                                    </Border>
                                </ControlTemplate>
                            </Setter.Value>
                        </Setter>
                    </Style>
                </Button.Style>
            </Button>
            <Label x:Name="lblAnrede" Content="Anrede" HorizontalAlignment="Left" Height="30" Margin="81,36,0,0" VerticalAlignment="Top" Width="75" />
            <TextBox x:Name="txtAnrede" HorizontalAlignment="Left" Margin="189,36,0,0" Text="Anrede" TextWrapping="Wrap" VerticalAlignment="Top" Width="120" Height="30" Background="#FFA6CDD1"/>
            <Label x:Name="lblVorwahl_int" Content="Vorwahl(int)" HorizontalAlignment="Left" Margin="81,322,0,0" VerticalAlignment="Top"/>
            <TextBox x:Name="txtVorwahl_int" HorizontalAlignment="Left" Margin="189,324,0,0" Text="Vorwahl" TextWrapping="Wrap" VerticalAlignment="Top" Width="120" Foreground="Black" Background="#FFA6CDD1" Height="23"/>
            <Label x:Name="lblVorwahl_nat" Content="Vorwahl(national)" HorizontalAlignment="Left" Margin="345,326,0,0" VerticalAlignment="Top"/>
            <TextBox x:Name="txtVorwahl_nat" HorizontalAlignment="Left" Margin="455,329,0,0" Text="Vorwahl" TextWrapping="Wrap" VerticalAlignment="Top" Width="120" Height="22" Background="#FFA6CDD1"/>
            <Label x:Name="lblTelefonnr" Content="Telefonnr" HorizontalAlignment="Left" Margin="630,329,0,0" VerticalAlignment="Top"/>
            <TextBox x:Name="txtTelefonnr" HorizontalAlignment="Left" Margin="695,329,0,0" Text="Telefonnr" TextWrapping="Wrap" VerticalAlignment="Top" Width="120" Height="23" Background="#FFA6CDD1"/>
            <Label x:Name="lblDurchwahl" Content="Durchwahl" HorizontalAlignment="Left" Margin="857,329,0,0" VerticalAlignment="Top"/>
            <Label x:Name="lblOrganisationseinheit" Content="Organisationseinheit" HorizontalAlignment="Left" Margin="717,36,0,0" VerticalAlignment="Top"/>
            <Label x:Name="lblStandort_RaumID" Content="Standort/Raum-ID" HorizontalAlignment="Left" Margin="717,67,0,0" VerticalAlignment="Top"/>
            <Label x:Name="lblReferenzuser" Content="Referenzuser" HorizontalAlignment="Left" Margin="717,179,0,0" VerticalAlignment="Top"/>
            <Label x:Name="lblAmtsberechtigung" Content="Amtsberechtigung" HorizontalAlignment="Left" Margin="815,360,0,0" VerticalAlignment="Top"/>
            <TextBox x:Name="txtOrganisationseinheit" HorizontalAlignment="Left" Margin="852,36,0,0" Text="Organisationseinheit" TextWrapping="Wrap" VerticalAlignment="Top" Width="120" Background="#FFA6CDD1"/>
            <TextBox x:Name="txtStandort_RaumID" HorizontalAlignment="Left" Margin="852,75,0,0" Text="Standort_RaumID" TextWrapping="Wrap" VerticalAlignment="Top" Width="120" Background="#FFA6CDD1"/>
            <ComboBox x:Name="cmbReferenzuser" HorizontalAlignment="Left" Margin="852,183,0,0" VerticalAlignment="Top" Width="120">

            </ComboBox>
            <ComboBox x:Name="Amtsberechtigung" HorizontalAlignment="Left" Margin="928,364,0,0" VerticalAlignment="Top" Width="120"/>
            <Label x:Name="lblMonieservice" Visibility="Hidden" Content="Monieservice" HorizontalAlignment="Left" Margin="397,131,0,0" VerticalAlignment="Top"/>
            <ComboBox x:Name="cmbMonieservice" Visibility="Hidden" HorizontalAlignment="Left" Margin="491,135,0,0" VerticalAlignment="Top" Width="120"/>
            <Button x:Name="btnRefuser" Content="User ermitteln" HorizontalAlignment="Left" Margin="1018,182,0,0" VerticalAlignment="Top" Height="28" Width="84" Foreground="#FF071885">
                <Button.Background>
                    <LinearGradientBrush EndPoint="0.5,1" StartPoint="0.5,0">
                        <GradientStop Color="Black" Offset="1"/>
                        <GradientStop Color="White" Offset="0"/>
                        <GradientStop Color="#FFD9DE62" Offset="0.918"/>
                    </LinearGradientBrush>
                </Button.Background>
                <Button.Style>
                    <Style TargetType="Button">
                        <Setter Property="Template">
                            <Setter.Value>
                                <ControlTemplate TargetType="Button">
                                    <Border Background="{TemplateBinding Background}" 
                                CornerRadius="20" 
                                BorderBrush="{TemplateBinding BorderBrush}" 
                                BorderThickness="{TemplateBinding BorderThickness}">
                                        <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                                    </Border>
                                </ControlTemplate>
                            </Setter.Value>
                        </Setter>
                    </Style>
                </Button.Style>
            </Button>
            <ComboBox x:Name="cmbDurchwahl" HorizontalAlignment="Left" Margin="928,334,0,0" VerticalAlignment="Top" Width="120" Background="#FFA6CDD1"/>
            <Button x:Name="btnDurchwahl" Content="Durchwahlen" HorizontalAlignment="Left" Margin="1062,333,0,0" VerticalAlignment="Top" Height="28" Width="84"  Foreground="#FF071885">
                <Button.Background>
                    <LinearGradientBrush EndPoint="0.5,1" StartPoint="0.5,0">
                        <GradientStop Color="Black" Offset="1"/>
                        <GradientStop Color="White" Offset="0"/>
                        <GradientStop Color="#FFD9DE62" Offset="0.918"/>
                    </LinearGradientBrush>
                </Button.Background>
                <Button.Style>
                    <Style TargetType="Button">
                        <Setter Property="Template">
                            <Setter.Value>
                                <ControlTemplate TargetType="Button">
                                    <Border Background="{TemplateBinding Background}" 
                                CornerRadius="20" 
                                BorderBrush="{TemplateBinding BorderBrush}" 
                                BorderThickness="{TemplateBinding BorderThickness}">
                                        <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                                    </Border>
                                </ControlTemplate>
                            </Setter.Value>
                        </Setter>
                    </Style>
                </Button.Style>
            </Button>

            <Button x:Name="btnEnde" Content="Ende" HorizontalAlignment="Left" Margin="225,489,0,0" VerticalAlignment="Top" Height="28" Width="84"  Foreground="#FF071885" RenderTransformOrigin="0.522,1.67">
                <Button.Background>
                    <LinearGradientBrush EndPoint="0.5,1" StartPoint="0.5,0">
                        <GradientStop Color="Black" Offset="1"/>
                        <GradientStop Color="White" Offset="0"/>
                        <GradientStop Color="#FFD9DE62" Offset="0.918"/>
                    </LinearGradientBrush>
                </Button.Background>
                <Button.Style>
                    <Style TargetType="Button">
                        <Setter Property="Template">
                            <Setter.Value>
                                <ControlTemplate TargetType="Button">
                                    <Border Background="{TemplateBinding Background}" 
                                CornerRadius="20" 
                                BorderBrush="{TemplateBinding BorderBrush}" 
                                BorderThickness="{TemplateBinding BorderThickness}">
                                        <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                                    </Border>
                                </ControlTemplate>
                            </Setter.Value>
                        </Setter>
                    </Style>
                </Button.Style>
            </Button>
            <Button x:Name="btnWeiter" Content="Weiter" HorizontalAlignment="Left"  Margin="1062,489,0,0" VerticalAlignment="Top" Height="28" Width="84" FontWeight="Bold" Foreground="#FF071885">
                <Button.Background>
                    <LinearGradientBrush EndPoint="0.5,1" StartPoint="0.5,0">
                        <GradientStop Color="Black" Offset="1"/>
                        <GradientStop Color="White" Offset="0"/>
                        <GradientStop Color="#FFD9DE62" Offset="0.918"/>
                    </LinearGradientBrush>
                </Button.Background>
                <Button.Style>
                    <Style TargetType="Button">
                        <Setter Property="Template">
                            <Setter.Value>
                                <ControlTemplate TargetType="Button">
                                    <Border Background="{TemplateBinding Background}" 
                                CornerRadius="20" 
                                BorderBrush="{TemplateBinding BorderBrush}" 
                                BorderThickness="{TemplateBinding BorderThickness}">
                                        <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                                    </Border>
                                </ControlTemplate>
                            </Setter.Value>
                        </Setter>
                    </Style>
                </Button.Style>
            </Button>
            <TextBox x:Name="Headline" HorizontalAlignment="Left" Margin="94,-49,0,0" Text="Änderungsdetails von Personen" TextWrapping="Wrap" VerticalAlignment="Top" Width="701" FontSize="24" Background="Transparent" BorderThickness="0" FontWeight="Bold"/>
            <TextBlock x:Name="txtBemmerkung" Background="White" HorizontalAlignment="Left" Height="69" Margin="189,403,0,0" Text="Bemerkung" TextWrapping="Wrap" VerticalAlignment="Top" Width="376"/>
            <Label HorizontalAlignment="Left" Height="46" Margin="81,403,0,0" VerticalAlignment="Top" Width="87">
                <TextBlock Text="Bemerkung/ Begründung" TextWrapping="Wrap"/>
            </Label>
            <TextBlock x:Name="txtBemmerkungMonie" Background="White" HorizontalAlignment="Left" Height="69" Margin="770,403,0,0" Text="Bemerkung" TextWrapping="Wrap" VerticalAlignment="Top" Width="376"/>
            <Label HorizontalAlignment="Left" Height="46" Margin="660,403,0,0" VerticalAlignment="Top" Width="87">
                <TextBlock Text="Bemerkung zu Monie" TextWrapping="Wrap"/>
            </Label>

        </Grid>
    </Border>
</Window>
"@

$reader = New-Object System.Xml.XmlNodeReader $xaml
$window = [System.Windows.Markup.XamlReader]::Load($reader)

# Find all controls
$txtVorname = $window.FindName("txtVorname")
$txtNachname = $window.FindName("txtNachname")
$txtUCCClient = $window.FindName("txtUCCClient")
$txtUsername = $window.FindName("txtUsername")
$txtAnrede = $window.FindName("txtAnrede")
$txtVorwahl_int = $window.FindName("txtVorwahl_int")
$txtVorwahl_nat = $window.FindName("txtVorwahl_nat")
$txtTelefonnr = $window.FindName("txtTelefonnr")
$txtOrganisationseinheit = $window.FindName("txtOrganisationseinheit")
$txtStandort_RaumID = $window.FindName("txtStandort_RaumID")
$cmbReferenzuser = $window.FindName("cmbReferenzuser")
$cmbMonieservice = $window.FindName("cmbMonieservice")
$cmbDurchwahl = $window.FindName("cmbDurchwahl")
$Amtsberechtigung = $window.FindName("Amtsberechtigung")
$btnSynchro = $window.FindName("btnSynchro")
$btnRefuser = $window.FindName("btnRefuser")
$btnDurchwahl = $window.FindName("btnDurchwahl")
$btnEnde = $window.FindName("btnEnde")
$btnWeiter = $window.FindName("btnWeiter")
#$txtNeu = $window.FindName("txtNeu")

# Add Click event for Synchro button
$btnSynchro.Add_Click({
    [System.Windows.MessageBox]::Show("Synchro button clicked!")
})

# Add Click event for Refuser button
$btnRefuser.Add_Click({
    [System.Windows.MessageBox]::Show("User ermitteln button clicked!")
})

# Add Click event for Durchwahl button
$btnDurchwahl.Add_Click({
    [System.Windows.MessageBox]::Show("Durchwahlen button clicked!")
})

# Add Click event for Ende button
$btnEnde.Add_Click({
    [System.Windows.MessageBox]::Show("Ende button clicked!")
    $window.Close()
})

# Add Click event for Weiter button
$btnWeiter.Add_Click({
    [System.Windows.MessageBox]::Show("Weiter button clicked!")
})

# Show the window
$window.ShowDialog() | Out