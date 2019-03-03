/*
 * InspIRCd -- Internet Relay Chat Daemon
 *
 *   Copyright (C) 2018 Michael Hazell <michaelhazell@hotmail.com>
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

 /* $ModAuthor: Michael Hazell */
 /* $ModAuthorMail: michaelhazell@hotmail.com */
 /* $ModDesc: Sends ASCII art on WHOIS for specified people */
 /* $ModDepends: core 2.0 */
 /* $ModConfig: <asciiswhois account="accountname" file="ascii/something.txt"> */

#include <fstream>
#include "inspircd.h"
#include "account.h"

class ModuleAsciiSwhois : public Module
{
public:
	ModuleAsciiSwhois()
	{
	}

	void init()
	{
		Implementation eventlist[] = {I_OnWhois};
		ServerInstance->Modules->Attach(eventlist, this, sizeof(eventlist)/sizeof(Implementation));
	}

	void OnWhois(User* source, User* dest)
	{
		AccountExtItem* accountitem = GetAccountExtItem();
		std::string* account = accountitem->get(dest); // Get the account name of the target
		if(account)
		{
			ConfigTagList tags = ServerInstance->Config->ConfTags("asciiswhois");
			while(tags.first != tags.second)
			{
				ConfigTag* tag = tags.first->second;
				tags.first++;
				std::string account_name = tag->getString("account", "");
				std::string file_name = tag->getString("file", "");

				if(*account == account_name)
				{
					std::string data_path(DATA_PATH);
					std::string full_path = data_path + "/" + file_name;
					std::ifstream infile(full_path.c_str());
					if(infile.is_open())
					{
						std::string buf;
						while(std::getline(infile, buf, '\n'))
						{
							// Check and see if there is a \r stuck at the end. If there is, remove it
							char& endchar = buf.at(buf.length() - 1);
							if(endchar == '\r')
							{
								buf.erase(buf.length() - 1);
							}

							ServerInstance->SendWhoisLine(source, dest, 320,
								"%s %s :%s", source->nick.c_str(), dest->nick.c_str(), buf.c_str());
						}
						infile.close();
					}
					else
					{
						ServerInstance->SNO->WriteGlobalSno('a', "m_asciiwhois: file " + full_path + " not found");
					}
				}
			}
		}
	}

	Version GetVersion()
	{
		return Version("Sends ASCII art on WHOIS for specified people", VF_COMMON);
	}
};

MODULE_INIT(ModuleAsciiSwhois)
