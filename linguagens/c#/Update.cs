public partial class Player {
    public virtual void Update () {
        if (DeleteStarted)
            return; //delte tolereance

        RemoveList.Clear (); //Handle timers
        RemoveList = SimpleTimers.ToList ().Where (x => x != null && x.Update ()).ToList ();

        if (RemoveList.Count > 0)
            foreach (SimpleTimer timer in RemoveList) {
                try {
                    SimpleTimers.Remove (timer);
                } catch { }
            }

        if (PlayerObjects.Count > 0)
            Time = 60000;

        if (Closeable && PlayerObjects.Count == 0 && !(this is Realm)) {
            Time -= 1000 / Program.Manager.LogicTicker.TPS;

            if (Time <= 0) {
                Time = 60000;
                Delete ();
            }
        }

        HandleObjects ();
    }
}

public class SimpleTimer {
    public bool Update () {
        if (Completed)
            return true;

        TimeLeft -= 1000 / Program.Manager.LogicTicker.TPS;

        if (TimeLeft <= 0) {
            try { DoWhat (); } catch (Exception ex) { Program.ConsoleManager.WriteError ($"Error executing an timer's action! [{ex}]"); }
            Completed = true;
            return true;
        }

        return false;
    }
}