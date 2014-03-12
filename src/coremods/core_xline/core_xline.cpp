/*
 * InspIRCd -- Internet Relay Chat Daemon
 *
 *   Copyright (C) 2014 Attila Molnar <attilamolnar@hush.com>
 *
 * This file is part of InspIRCd.  InspIRCd is free software: you can
 * redistribute it and/or modify it under the terms of the GNU General Public
 * License as published by the Free Software Foundation, version 2.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
 * details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */


#include "inspircd.h"
#include "core_xline.h"

bool InsaneBan::MatchesEveryone(const std::string& mask, MatcherBase& test, User* user, const char* bantype, const char* confkey)
{
	ConfigTag* insane = ServerInstance->Config->ConfValue("insane");

	if (insane->getBool(confkey))
		return false;

	float itrigger = insane->getFloat("trigger", 95.5);

	long matches = test.Run(mask);

	if (!matches)
		return false;

	float percent = ((float)matches / (float)ServerInstance->Users->clientlist->size()) * 100;
	if (percent > itrigger)
	{
		ServerInstance->SNO->WriteToSnoMask('a', "\2WARNING\2: %s tried to set a %s-line mask of %s, which covers %.2f%% of the network!", user->nick.c_str(), bantype, mask.c_str(), percent);
		return true;
	}
	return false;
}

bool InsaneBan::IPHostMatcher::Check(User* user, const std::string& mask) const
{
	return ((InspIRCd::Match(user->MakeHost(), mask, ascii_case_insensitive_map)) ||
			(InspIRCd::Match(user->MakeHostIP(), mask, ascii_case_insensitive_map)));
}

class CoreModXLine : public Module
{
	CommandEline cmdeline;
	CommandGline cmdgline;
	CommandKline cmdkline;
	CommandQline cmdqline;
	CommandZline cmdzline;

 public:
	CoreModXLine()
		: cmdeline(this), cmdgline(this), cmdkline(this), cmdqline(this), cmdzline(this)
	{
	}

	Version GetVersion() CXX11_OVERRIDE
	{
		return Version("Provides the ELINE, GLINE, KLINE, QLINE, and ZLINE commands", VF_VENDOR|VF_CORE);
	}
};

MODULE_INIT(CoreModXLine)
