﻿
Console.WriteLine(".NET Graph App-only Tutorial\n");

var settings = Settings.LoadSettings();

// Initialize Graph
InitializeGraph(settings);

int choice = -1;

while (choice != 0)
{
  Console.WriteLine("Please choose one of the following options:");
  Console.WriteLine("0. Exit");
  Console.WriteLine("1. Display access token");
  Console.WriteLine("2. List users");
  Console.WriteLine("3. Make a Graph call");

  try
  {
    choice = int.Parse(Console.ReadLine() ?? string.Empty);
  }
  catch (System.FormatException)
  {
    // Set to invalid value
    choice = -1;
  }

  switch(choice)
  {
    case 0:
      // Exit the program
      Console.WriteLine("Goodbye...");
      break;
    case 1:
      // Display access token
      await DisplayAccessTokenAsync();
      break;
    case 2:
      // List users
      await ListUsersAsync();
      break;
    case 3:
      // Run any Graph code
      await MakeGraphCallAsync();
      break;
    default:
      Console.WriteLine("Invalid choice! Please try again.");
      break;
  }
}

void InitializeGraph(Settings settings)
{
  GraphHelper.InitializeGraphForAppOnlyAuth(settings);
}

async Task DisplayAccessTokenAsync()
{
  try
  {
    var appOnlyToken = await GraphHelper.GetAppOnlyTokenAsync();
    Console.WriteLine($"App-only token: {appOnlyToken}");
  }
  catch (Exception ex)
  {
    Console.WriteLine($"Error getting app-only access token: {ex.Message}");
  }
}

async Task ListUsersAsync()
{
  try
  {
    var userPage = await GraphHelper.GetUsersAsync();

    // Output each users's details
    foreach (var user in userPage.CurrentPage)
    {
      Console.WriteLine($"User: {user.DisplayName ?? "NO NAME"}");
      Console.WriteLine($"  ID: {user.Id}");
      Console.WriteLine($"  Email: {user.Mail ?? "NO EMAIL"}");
    }

    // If NextPageRequest is not null, there are more users
    // available on the server
    // Access the next page like:
    // userPage.NextPageRequest.GetAsync();
    var moreAvailable = userPage.NextPageRequest != null;

    Console.WriteLine($"\nMore users available? {moreAvailable}");
  }
  catch (Exception ex)
  {
    Console.WriteLine($"Error getting users: {ex.Message}");
  }
}

async Task MakeGraphCallAsync()
{
  // TODO
}

