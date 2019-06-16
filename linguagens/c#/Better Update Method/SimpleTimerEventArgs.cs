public class SimpleTimerEventArgs {
    public SimpleTimerEventArgs (bool completed) => IsCompleted = completed;

    public bool IsCompleted { get; }
}

public class SimpleTimer {
    public SimpleTimer (long timeLeft) {
        TimeLeft = timeLeft;
        OnSimpleTimerComplete += SimpleTimerHandler;
        SimpleTimerTask = new Task (async () => {
            do {
                var cooldown = 1000 / Program.Manager.LogicTicker.TPS;

                if (!(TimeLeft - cooldown <= 0))
                    await Task.Delay (Math.Max (0, cooldown));
                else
                    break;
            } while (IsCompleted);
        });
    }

    public void Start () => SimpleTimerTask.Start ();

    public delegate void SimpleTimerHandler (object sender, SimpleTimerArgs args);
    private SimpleTimerEventArgs SimpleTimerEvent;
    private long TimeLeft { get; } = -1;
    private bool IsCompleted { get; set; } = false;
    private Task SimpleTimerTask { get; }

    private void OnSimpleTimerComplete (object sender, SimpleTimerArgs args) {
        try { DoWhat (); } catch (Exception e) { Program.ConsoleManager.WriteError ($"Error executing an timer's action! [{e}]"); }
        IsCompleted = true;
        SimpleTimerTask.Abort ();
    }

    private void DoWhat () {
        // i don't know what even is this, so ok
    }
}

public partial class Player {
    public virtual void Update () {
        if (DeleteStarted)
            return;

        RemoveList.Clear ();
        RemoveList = SimpleTimers.ToList ().Where (tmr => tmr?.IsCompleted).Select (tmr => {
            SimpleTimers.Remove (tmr);
            return tmr;
        }).ToList ();

        if (PlayerObjects.Count > 0)
            Time = 60000;

        if (Closeable && PlayerObjects.Count == 0 && !(this is Realm)) {
            Time -= 1000 / Program.Manager.LogicTicker.TPS;

            if (Time <= 0) {
                Time = 60000;
                Delete (); // another method whose i'm clueless what is this
            }
        }

        HandleObjects ();
    }
}