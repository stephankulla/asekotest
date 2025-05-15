using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Input;

public class MyWindow : Window
{
    public MyWindow()
    {
        // Fenster-Eigenschaften
        this.Width = 400;
        this.Height = 300;
        this.WindowStyle = WindowStyle.None;
        this.AllowsTransparency = true;
        this.Background = Brushes.Transparent;

        // Border erstellen
        Border border = new Border();
        border.Background = Brushes.White;
        border.CornerRadius = new CornerRadius(20);
        border.BorderBrush = Brushes.Gray;
        border.BorderThickness = new Thickness(2);

        // Grid erstellen
        Grid grid = new Grid();

        // Schließen-Button erstellen
        Button closeButton = new Button();
        closeButton.Content = "Schließen";
        closeButton.HorizontalAlignment = HorizontalAlignment.Center;
        closeButton.VerticalAlignment = VerticalAlignment.Bottom;
        closeButton.Margin = new Thickness(10);
        closeButton.Click += (s, e) => this.Close();

        // Button zum Grid hinzufügen
        grid.Children.Add(closeButton);

        // Grid in Border einfügen
        border.Child = grid;

        // Border als Fensterinhalt setzen
        this.Content = border;

        // Fenster bewegbar machen
        this.MouseDown += (s, e) =>
        {
            if (e.LeftButton == MouseButtonState.Pressed)
                this.DragMove();
        };
    }
}