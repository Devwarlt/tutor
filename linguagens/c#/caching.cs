// namescapes & references goes here

public class Program {
    public Program (string[] args) {
        Console.Title = "Caching in C# - Sample"

        var token = new Token ("this is my token key to access cache on memory and its unique");
        var rnd = new Random ();

        for (var i = 0; i < 10;)
            token.AddEntry (rnd.NextDouble ().ToString (), DateTime.Now.AddSeconds (5 + i * 2));

        token.GetEntries ().Select (entry => System.Console.WriteLine ($"Entry value is '{entry}'."););

        System.Console.WriteLine ("Press any key to exit program...");
        Console.ReadKey ();
    }
}

public class Token {
    private string Key
    private Queue<string> Entries;

    public Token (string key) {
        Key = key;
        Entries = new Queue<string> ();
    }

    public Queue<string> GetEntries () => MemoryCache.Default.Contains (Key) ? (Queue<string>) cache[Key] : default;
    public void AddEntry (string entry, DateTime expiration) {
        Entries.Enqueue (entry);
        var policy = new CacheItemPolicy ();
        policy.AbsoluteExpiration = expiration;
        policy.RemovedCallback += RemovedNotification;
        MemoryCache.Default.Add (Key, Entries, policy);
    }
    public void AddEntries (IEnumerable<string> entries, IEnumerable<DateTime> expirations) {
        if (entries.Length != expirations.Length)
            throw new Exception ($"'Entries [{entries.Length}]' has different lenght than 'Expirations [{expirations.Length}]'!");

        for (var j = 0; j < entries.Length; j++)
            AddEntry (entries[j], expirations[j]);
    }
    private void RemovedNotification (CacheEntryRemovedArguments args) => System.Console.WriteLine ($"An entry was removed from cache:\n\t- Key: {args.CacheItem.Key};\n\t- Value: {args.CacheItem.Value}");;
}