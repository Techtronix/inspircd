#include "inspircd.h"

class CommandSVSJoinKey : public Command
{
 public:
	CommandSVSJoinKey(Module* Creator) : Command(Creator, "SVSJOINKEY", 3)
	{
		flags_needed = FLAG_SERVERONLY;
	}

	CmdResult Handle(const std::vector<std::string>& parameters, User *user)
	{
		// Check for valid channel name
		if (!ServerInstance->IsChannel(parameters[1].c_str(), ServerInstance->Config->Limits.ChanMax))
			return CMD_FAILURE;

		// Check target exists
		User* u = ServerInstance->FindUUID(parameters[0]);
		if (!u)
			return CMD_FAILURE;

		/* only join if it's local, otherwise just pass it on! */
		if (IS_LOCAL(u))
			Channel::JoinUser(u, parameters[1].c_str(), false, parameters[2].c_str(), false, ServerInstance->Time());
		return CMD_SUCCESS;
	}

	RouteDescriptor GetRouting(User* user, const std::vector<std::string>& parameters)
	{
		User* u = ServerInstance->FindUUID(parameters[0]);
		if (u)
			return ROUTE_OPT_UCAST(u->server);
		return ROUTE_LOCALONLY;
	}
};

class ModuleSVSJoinKeyed : public Module
{
	CommandSVSJoinKey comm;
 public:
	ModuleSVSJoinKeyed() : comm(this)
	{
	}

	void init()
	{
		ServerInstance->Modules->AddService(comm);
	}

	Version GetVersion()
	{
		return Version("SVSJOIN with channel key support", VF_COMMON);
	}
};

MODULE_INIT(ModuleSVSJoinKeyed)