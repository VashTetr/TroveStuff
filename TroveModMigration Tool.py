import os
import shutil
import sys
import winreg
from winreg import *
import re


def isEqualToIgnoreCase(source, target):
    if source == target:
        return True
    if source.lower() is target.lower():
        return True
    else:
        return False


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
    appdatalocation = ""
    if os.path.exists(os.getenv('APPDATA') + "\\Trove\\ModCfgs"):
        appdatalocation = os.getenv('APPDATA') + "\\Trove\\ModCfgs"
    elif not os.path.exists(os.getenv('APPDATA') + "\\Trove\\ModCfg"):
        print("ModCfgs folder in Appdata was not found.")
        print("Creating ModCfgs folder")
        try:
            os.mkdir(os.getenv('APPDATA') + "\\Trove\\ModCfgs")
            print("Finished creating ModCfgs folder\n")
        except FileNotFoundError:
            print("ModCfgs folder could not be created.\n")
    else:
        print("Trove folder in Appdata not found.")
    return appdatalocation


def tryToFindGlyphTrove():
    DefaultPath = "SOFTWARE\\WOW6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\Glyph Trove"
    PathsToTry = DefaultPath, DefaultPath + " Europe", DefaultPath + " North America"
    global gresult
    gresult = False, "Not Found"
    glyphkey = ""
    for path in PathsToTry:

        try:
            glyphkey = winreg.OpenKey(winreg.HKEY_LOCAL_MACHINE, path)

        except:
            pass
    if glyphkey == "":
        return False, "Not Found"
    else:
        try:
            gresult = True, winreg.QueryValueEx(glyphkey, "InstallLocation")[0]
        except:
            return False, "Not Found"
            pass


def checkTroveinstallation():
    sresult = False, "Not Found"
    gresult = tryToFindGlyphTrove()

    try:
        try:

            steamkey = winreg.OpenKey(winreg.HKEY_LOCAL_MACHINE,
                                      "SOFTWARE\\WOW6432Node\\Valve\\SteamService")
            steamvalue = winreg.QueryValueEx(steamkey, "installpath_default")[0]

            if os.path.exists(steamvalue + "\\steamapps\\common\\Trove"):
                sresult = True, steamvalue + "\\steamapps\\common\\Trove\\Games\\Trove\\Live\\mods"
            else:
                sresult = False, "Not Found"
        except FileNotFoundError:
            pass
        except WindowsError:
            raise "Registry could not be read. Please rerun the script as admin."



    finally:
        if isEqualToIgnoreCase(sresult[1], "Not Found") and isEqualToIgnoreCase(gresult[1], "Not Found"):
            print("Trove is not installed on this Machine or could not be found.")
    return gresult, sresult


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

    return path + "\\ModCfgs", path + "\\Mods"


def decision():
    if checkTroveinstallation()[1][0]:
        steamstring = "[Steam Trove installed]"
    else:
        steamstring = "[Steam Trove not installed]"

    if gresult[0]:
        glyphstring = "[Glyph Trove installed]"
    else:
        glyphstring = "[Glyph Trove not installed]"

    while True:
        print(
            "Choose which Trove version you are using\n    [1] Glyph " + glyphstring + "\n    [2] Steam " + steamstring)
        choice = input("Enter your choice (1 or 2): ")

        if choice in ("1", "2"):
            return choose(choice)
        else:
            print("Invalid chooice. Please enter 1 or 2.")


def choose(choice):
    chosendir = ""
    if int(choice) == 1 and checkTroveinstallation()[0][0] is True:
        chosendir = checkTroveinstallation()[0][1]
    elif int(choice) == 1 and checkTroveinstallation()[0][0] is False:
        print("Trove on Glyph is not installed or could not be found.")
        return
    if int(choice) == 2 and checkTroveinstallation()[1][0] is True:
        chosendir = checkTroveinstallation()[1][1]
    elif int(choice) == 2 and checkTroveinstallation()[1][0] is False:
        print("Trove on Steam is not installed or could not be found.")
        return
    if isEqualToIgnoreCase(chosendir, "Not Found"):
        print("Trove was not found")
    finalexecution(chosendir)


def finalexecution(chosendir):
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
            shutil.move(modpath + "\\" + modlist[i], chosendir + "\\" + modlist[i])
            print("[TroveModMigrationTool: " + modpath + "\\" + modlist[i] + " Moved to " + chosendir + "\\" + modlist[
                i] + "]")

    for j in range(amountofcfgs):
        if os.path.exists(getappdatalocation() + "\\" + cfglist[j]):
            pass
        else:
            shutil.move(cfgpath + "\\" + cfglist[j], getappdatalocation() + "\\" + cfglist[j])
            print(
                "[TroveModMigrationTool: " + cfgpath + "\\" + cfglist[j] + " Moved to " + getappdatalocation() + "\\" +
                cfglist[j] + "]")

    print("Mod Migration finished.")
    for k in range(1):
        input("press Enter to exit")
        exit(1)


def printFoldersAndCheckErrors():
    getappdatalocation()
    checkTroveinstallation()
    checkfolderavailable()

    # print the folders:
    print("Trove Appdata Location: " + getappdatalocation())
    print("Current Folder Path: " + path)
    print("Current mod Folder Path: " + checkfolderavailable()[1])
    print("Current ModCfgs Folder Path: " + checkfolderavailable()[0])
    print("Steam Trove Mod install Path: " + checkTroveinstallation()[1][1])
    print("Glyph Trove Mod install Path: " + gresult[1])
    print("\n")


def main():
    printFoldersAndCheckErrors()
    print(descriptiontext())  # Write Script Description
    while True:
        decision()  # Executing Decision making loop


if __name__ == "__main__":
    global path
    if getattr(sys, 'frozen', False):
        path = os.path.dirname(sys.executable)
    else:
        path = os.path.dirname(os.path.abspath(__file__))
    main()
