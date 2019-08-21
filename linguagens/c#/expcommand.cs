public class ExpCommand : Command {
	public ExpCommand() : base("exp", (int)AccountType.DEVELOPER) {}
	
    protected override bool Process(Player player, RealmTime time, string[] args) {
        if (args.Length == 0) {
            player.SendHelp("Usage: /exp <experience>");
            return false;
        }

		if (int.TryParse(args[0], out int experience)) {
            player.Experience += experience;
            player.FakeExperience += experience;
            player.UpdateCount++;

            player.SendHelp($"You gained {experience} experience!");

            return true;
        }
        else {
            player.SendHelp("Invalid experience parameter, use integer value type of.");
            return false;
        }
	}
}