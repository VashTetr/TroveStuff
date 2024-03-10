import os
import shutil
import winreg

path = os.path.dirname(os.path.realpath(__file__))


def descriptiontext():
    return """
    -------------------------------------------------------------------------------------
    This Script inserts your mods and ModCfgs into their respective Directory.
    To use this Script you will need to have 2 Folders in the current Script Directory
    They should be named:
    mods
    ModCfgs
    In These Folders there should be the desired .tmod files (mods folder) and .cfg files
    (ModCfgs folder)
    -------------------------------------------------------------------------------------
    """


def getappdatalocation():
    global appdatalocation
    appdatalocation = ""
    if os.path.exists(os.getenv('APPDATA') + "\\Trove\\ModCfgs"):
        appdatalocation = os.getenv('APPDATA') + "\\Trove\\ModCfgs"
    elif not os.path.exists(os.getenv('APPDATA') + "\\Trove\\ModCfg") and os.path.exists(
            os.getenv('APPDATA') + "\\Trove"):
        print("ModCfgs folder in Appdata was not found.")
        print("Creating ModCfgs folder")
        try:
            os.mkdir(os.getenv('APPDATA') + "\\Trove\\ModCfgs")
        except:
            print("ModCfgs folder could not be created.\n")
        print("Finished creating ModCfgs folder\n")

    else:
        print("Trove folder in Appdata not found.")


def checkTroveinstallation():
    global steaminstall, glyphinstall
    try:
        try:
            steamkey = winreg.OpenKey(winreg.HKEY_LOCAL_MACHINE,
                                      "SOFTWARE\\WOW6432Node\\Valve\\SteamService")
            steamvalue = winreg.QueryValueEx(steamkey, "installpath_default")[0]

            if os.path.exists(steamvalue + "\\steamapps\\common\\Trove"):
                steaminstall = True, steamvalue + "\\steamapps\\common\\Trove\\Games\\Trove\\Live\\mods"
        except:
            steaminstall = False, None

        try:
            glyphkey = winreg.OpenKey(winreg.HKEY_LOCAL_MACHINE,
                                      "SOFTWARE\\WOW6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\Glyph "
                                      "Trove")
            glyphvalue = winreg.QueryValueEx(glyphkey, "InstallLocation")[0]
            if os.path.exists(glyphvalue):
                glyphinstall = True, glyphvalue + "\\mods"
        except:
            glyphinstall = False, None


    finally:
        if steaminstall[0] is False and glyphinstall[0] is False:
            print(
                "Trove is not installed on this Machine or could not be found. Please contact the developer of this "
                "Script or analyse the issue yourself")


def checkfolderavailable():
    if not os.path.exists(path + "\\ModCfgs"):
        print("ModCfgs folder is not present in the current Directory. \n")
        for i in range(1):
            input("press Enter to exit")
            exit(1)

    elif not os.path.exists(path + "\\Mods"):
        print("mods folder is not present in the current Directory. \n")
        for i in range(1):
            input("press Enter to exit")
            exit(1)


def decision():
    global decisionstring
    global decisionmade
    global choice
    decisionmade = True
    steamstring, glyphstring = " ", " "
    checkTroveinstallation()
    if steaminstall[0]:
        steamstring = "[Steam Trove installed]"
    else:
        steamstring = "[Steam Trove not installed]"

    if glyphstring[0]:
        glyphstring = "[Glyph Trove installed]"
    else:
        glyphstring = "[Glyph Trove not installed]"
    while decisionmade is True:
        print(
            "Choose which Trove version you are using\n    [1] Steam " + steamstring + "\n    [2] Glyph " + glyphstring)
        choice = input("Enter your choice (1 or 2): ")

        if choice in ("1", "2"):
            return int(choice)
        else:
            print("Invalid chooice. Please enter 1 or 2.")


def choose():
    global chosendir
    if choice == "1":
        chosendir = steaminstall[1]
    elif choice == "2":
        chosendir = glyphinstall[1]
    else:
        return "Something went Wrong. Please contact the Developer of this Script"


def finalexecution():
    checkfolderavailable()  # Check if ModCfgs folder and or Mods folder available

    modpath = path + "\\" + "mods"
    cfgpath = path + "\\" + "ModCfgs"

    modlist = os.listdir(path + "\\mods")
    amountofmods = len(modlist) - 1

    cfglist = os.listdir(path + "\\ModCfgs")
    amountofcfgs = len(cfglist) - 1

    for i in range(amountofmods):
        if os.path.exists(chosendir + "\\" + modlist[i]):
            pass
        else:
            shutil.copy(modpath + "\\" + modlist[i], chosendir + "\\" + modlist[i])

    for j in range(amountofcfgs):
        if os.path.exists(appdatalocation + "\\" + cfglist[j]):
            pass
        else:
            shutil.copy(cfgpath + "\\" + cfglist[j], appdatalocation + "\\" + cfglist[j])

    print("Mod Migration finished.")
    for k in range(1):
        input("press Enter to exit")
        exit(1)


def main():
    print(descriptiontext())  # Write Script Description
    getappdatalocation()  # Getting Appdata location
    decision()  # Executing Decision making loop
    choose()  # user choose which Trove they use
    finalexecution()


if __name__ == "__main__":
    main()
