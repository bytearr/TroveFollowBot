#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

global TOGGLE := false
global x_coord_temp := 0
global y_coord_temp := 0
global z_coord_temp := 0
global worldid := 0
global worldid2 := 0
global pointer
global x_coord
global y_coord
global z_coord
global distance
global world_id_offset_string1
global world_id_offset_string2

global SonicAOB := [0xDC, 0x67, 0x68, 0xC6]
global SonicAOBe := [0xDC, 0x47, 0x68, 0xC6]
global SonicOC := "DC67"
global SonicNew := "DC47"

global UncapAOB := [0x75, 0x0B, 0x6A, 0x21, 0xFF, 0x15] 
global UncapAOBe := [0xEB, 0x0B, 0x6A, 0x21, 0xFF, 0x15]
global UncapOC := "75"
global UncapNew := "EB"

global NoclipAOB := [0x74, 0x31, 0xFF, 0x73, 0x14, 0x8B, 0x47, 0x04, 0x2B, 0x07] 
global NoclipAOBe := [0xEB, 0x31, 0xFF, 0x73, 0x14, 0x8B, 0x47, 0x04, 0x2B, 0x07] 
global NoclipOC := "74"
global NoclipNew := "EB"

global AntiGravAOB := [0xF3, 0x0F, 0x10, 0x05, XX, XX, XX, XX,0xF3, 0x0F, 0x11, 0x45, 0xFC, 0xD9, 0x45, 0xFC, 0x8B, 0xE5, 0x5D, 0xC3, 0xD9, 0x05, XX, XX, XX, XX] 
global AntiGravAOBe := [0xF3, 0x0F, 0x10, 0x0D, XX, XX, XX, XX,0xF3, 0x0F, 0x11, 0x45, 0xFC, 0xD9, 0x45, 0xFC, 0x8B, 0xE5, 0x5D, 0xC3, 0xD9, 0x05, XX, XX, XX, XX]
global AntiGravOC := "F30F1005" 
global AntiGravNew := "F30F100D" 

global LootAOB := [0x76, 0x45, 0xDD, 0x87, 0x78, 0x03, 0x00, 0x00, 0x8B, 0x8F, 0x68, 0x06, 0x00, 0x00, 0xDD, 0x5C, 0x24, 0x10]
global LootAOBe := [0x77, 0x45, 0xDD, 0x87, 0x78, 0x03, 0x00, 0x00, 0x8B, 0x8F, 0x68, 0x06, 0x00, 0x00, 0xDD, 0x5C, 0x24, 0x10]
global LootOC := "76"
global LootNew := "77"

global AntiAfkAOB := [0x55, 0x8B, 0xEC, 0x83, 0xE4, 0xF8, 0xD9, 0xEE, 0x83, 0xEC, 0x58, 0x56]
global AntiAfkAOBe := [0xC3, 0x8B, 0xEC, 0x83, 0xE4, 0xF8, 0xD9, 0xEE, 0x83, 0xEC, 0x58, 0x56]
global AntiAfkOC := "55"
global AntiAfkNew := "C3"

global MountAOB := [0x74,  XX, 0x8B, 0x07, 0x8B, 0xCF, 0x6A, 0x00, 0x6A, 0x00, 0xFF, 0x50]
global MountAOBe := [0xEB,  XX, 0x8B, 0x07, 0x8B, 0xCF, 0x6A, 0x00, 0x6A, 0x00, 0xFF, 0x50]
global MountOC := "74"
global MountNew := "EB"

global AttackAOB := [0xDF, 0xF1, 0xDD, 0xD8, 0x72, 0x1F]
global AttackAOBe := [0xDF, 0xF0, 0xDD, 0xD8, 0x72, 0x1F]
global AttackOC := "DFF1"
global AttackNew := "DFF0"

global MapZoomAOB := [0x77, XX, 0xB8, XX, XX, XX, XX, 0xF3, 0x0F, 0x10, 0x08, 0xF3, 0x0F, 0x11, 0x89, XX, XX, XX, XX, 0x8B, 0x89]
global MapZoomAOBe := [0xEB, XX, 0xB8, XX, XX, XX, XX, 0xF3, 0x0F, 0x10, 0x08, 0xF3, 0x0F, 0x11, 0x89, XX, XX, XX, XX, 0x8B, 0x89]
global MapZoomOC := "77"
global MapZoomNew := "EB"

global ZoomAOB := [0xF3, 0x0F, 0x11, 0x5F, 0x2C]
global ZoomAOBe := [0xF3, 0x0F, 0x11, 0x5F, 0x2C]
global ZoomOC := "F30F115F"
global ZoomNew := "F30F1157"

global OmniAOB := [0xDF, 0xF1, 0xDD, 0xD8, 0x72, 0x35, 0x8D]
global OmniAOBe := [0xDF, 0xF0, 0xDD, 0xD8, 0x72, 0x35, 0x8D]
global OmniOC := "DFF1"
global OmniNew := "DFF0"

global CamAOB := [0x0F, 0x29, 0x01, 0xC7, 0x41, 0x34, 0x00, 0x00, 0x00, 0x00, 0x0F]
global CamAOBe := [0x90, 0x90, 0x90, 0xC7, 0x41, 0x34, 0x00, 0x00, 0x00, 0x00, 0x0F]
global CamOC := "0F2901"
global CamNew := "909090"

global MineAOB := [0xDF, 0xF1, 0xDD, 0xD8, 0x72, 0x61]
global MineAOBe := [0xDF, 0xF0, 0xDD, 0xD8, 0x72, 0x61]
global MineOC := "DFF1"
global MineNew := "DFF0"

;global NoStatEncAOB1 := [0x35, XX, XX, XX, XX, 0x89, 0x01, 0x5D, 0xC2, 0x04, 0x00]
;global NoStatEncAOBe1 := [0x90, 0x90, 0x90, 0x90, 0x90, 0x89, 0x01, 0x5D, 0xC2, 0x04, 0x00]
;global NoStatEncOC1 := "35" ; idk how to revert it. i put this one on hold
;global NoStatEncNew1 := "90909090"

;global NoStatEncAOB2 := [0x35, XX, XX, XX, XX, 0x89, 0x45, 0xFC 0xD9, 0x45, 0xFC, 0x8B, 0xE5, 0x5D, 0xC3]
;global NoStatEncAOBe2 := [0x90, 0x90, 0x90, 0x90, 0x90, 0x89, 0x45, 0xFC 0xD9, 0x45, 0xFC, 0x8B, 0xE5, 0x5D, 0xC3]
;global NoStatEncOC2 := "35" ;same as the one above
;global NoStatEncNew2 := "9090909090"

;idk if this actually works
global WaterAOB := [0x89, 0xBE, 0x90, 0x01, 0x00, 0x00, 0x85, 0xC9, 0x74, 0x65]
global WaterAOBe := [0xC7, 0x86, 0x90, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
global WaterOC := "89BE9001000085C97465"
global WaterNew := "C7869001000000000000"

;this is not even finding correct so the aob is prob wrong. cba to fix it or find out why its not working
global WaterAOB2 := [0xD9, 0x80, 0xD8, 0x00, 0x00, 0x00, 0xC3, 0xCC, 0xCC, 0xCC, 0xCC, 0xCC]
global WaterAOBe2 := [0x68, 0x00, 0x00, 0xF0, 0xC1, 0xD9, 0x04, 0x24, 0x83, 0xC4, 0x04, 0xC3]
global WaterOC2 := "D980D8000000C3CCCCCCCC"
global WaterNew2 := "680000F0C1D9042483C404C3"

global NoRenderAOB := [0x0F, 0x84, 0x62, 0x01, 0x00, 0x00, 0x8B, 0x0D]
global NoRenderAOBe := [0xE9, 0x63, 0x01, 0x00, 0x00, 0x90, 0x8B, 0x0D]
global NoRenderOC := "0F8462010000"
global NoRenderNew := "E96301000090"

;doesnt work aswell has to be fixed
global NoSkillVFXAOB := [0xF3, 0x0F, 0x11, 0x44, 0x24, 0x24, 0xF3, 0x0F, 0x58, 0x84, 0x24, 0x80, 0x00, 0x00, 0x00, 0x50, 0xF3, 0x0F, 0x11, 0x43, 0x24, 0xE8]
global NoSkillVFXAOBe := [0xF3, 0x0F, 0x11, 0x4C, 0x24, 0x24, 0xF3, 0x0F, 0x58, 0x84, 0x24, 0x80, 0x00, 0x00, 0x00, 0x50, 0xF3, 0x0F, 0x11, 0x43, 0x24, 0xE8]
global NoSkillVFXOC :=  "F30F1144"
global NoSkillVFXNew := "F30F114C"

oldPID := 0
gosub, refreshMemoryClass

skip() {
    WinGet, trovers, List, ahk_exe Trove.exe
    loop, %trovers% {
        skipId := trovers%A_Index%
        if (WinActive("ahk_id " . skipId)) {
            WinGet, skipPid, PID, ahk_id %skipId%
            WinGet, skipHwnd, ID, ahk_Pid %skipPid%
            skipBase := getProcessBaseAddress(skipHwnd)

            x_coord_temp := HexToFloat(ReadMemory(GetAddress(skipPid, skipBase, pointer, x_coord), skipPid))
            y_coord_temp := HexToFloat(ReadMemory(GetAddress(skipPid, skipBase, pointer, y_coord), skipPid))
            z_coord_temp := HexToFloat(ReadMemory(GetAddress(skipPid, skipBase, pointer, z_coord), skipPid))

            worldid := ReadMemoryy(GetAddress(skipPid, skipBase, pointer, world_id_offset_string2), skipPid,8)
            if (worldid == 0){
                worldid := ReadMemoryy(GetAddress(skipPid, skipBase, pointer, world_id_offset_string1), skipPid,8)
            }
        }
        if (!WinActive("ahk_id " . skipId)) {
            WinGet, skipPid, PID, ahk_id %skipId%
            WinGet, skipHwnd, ID, ahk_Pid %skipPid%
            skipBase := getProcessBaseAddress(skipHwnd)

            x_helper_address := GetAddress(skipPid, skipBase, pointer, x_coord)
            y_helper_address := GetAddress(skipPid, skipBase, pointer, y_coord)
            z_helper_address := GetAddress(skipPid, skipBase, pointer, z_coord)

            x_helper_helper2 := HexToFloat(ReadMemory(x_helper_address, skipPid))
            y_helper_helper2 := HexToFloat(ReadMemory(y_helper_address, skipPid))
            z_helper_helper2 := HexToFloat(ReadMemory(z_helper_address, skipPid))

            worldid2 := ReadMemoryy(GetAddress(skipPid, skipBase, pointer, world_id_offset_string2), skipPid,8)
            if (worldid2 == 0){
                worldid2 := ReadMemoryy(GetAddress(skipPid, skipBase, pointer, world_id_offset_string1), skipPid,8)
            }

            if(worldid == worldid2) {
                dist := min(distance / (Sqrt((x_helper_helper2 - x_coord_temp)**2 + (y_helper_helper2 - y_coord_temp)**2 + (z_helper_helper2 - z_coord_temp)**2)), 1)
                if(dist != "") {
                    t1 := x_helper_helper2 + (x_coord_temp - x_helper_helper2) * dist
                    t2 := y_helper_helper2 + (y_coord_temp - y_helper_helper2) * dist
                    t3 := z_helper_helper2 + (z_coord_temp - z_helper_helper2) * dist

                    WriteProcessMemory(skipPid, x_helper_address, FloatToHex(t1), 4)
                    WriteProcessMemory(skipPid, y_helper_address, FloatToHex(t2), 4)
                    WriteProcessMemory(skipPid, z_helper_address, FloatToHex(t3), 4)
                }
            }
        }
    }
}

getProcessBaseAddress(Handle) {
Return DllCall( A_PtrSize = 4
? "GetWindowLong"
: "GetWindowLongPtr"
    , "Ptr", Handle
    , "Int", -6
    , "Int64")
}

GetAddress(PID, Base, Address, Offset = "") {
    pointerBase := base + Address
    if (Offset == "")
    {
        return pointerBase
    }
    y := ReadMemory(pointerBase,PID)
    OffsetSplit := StrSplit(Offset, "+")
    OffsetCount := OffsetSplit.MaxIndex()
    Loop, %OffsetCount%
    {
        if (a_index = OffsetCount)
        {
            Address := (y + OffsetSplit[a_index])
        }
        Else 
            if(a_index = 1) 
        {
            y := ReadMemory(y + OffsetSplit[a_index],PID)
        }
        Else
        {
            y := ReadMemory(y + OffsetSplit[a_index],PID)
        }
    }
Return Address
}

ReadMemory(MADDRESS, pid) {
    VarSetCapacity(MVALUE, 4, 0)
    ProcessHandle := DllCall("OpenProcess", "UInt", 0x0010, "Int", 0, "Int", pid, "Ptr")
    DllCall("ReadProcessMemory", "UInt", ProcessHandle, "Ptr", MADDRESS, "Ptr", &MVALUE, "UInt", 4)
    result := 0  ; Initialize result to zero
    Loop 4
        result += *(&MVALUE + A_Index-1) << 8*(A_Index-1)
    DllCall("CloseHandle", "Ptr", ProcessHandle)
    Return result
}

WriteProcessMemory(pid, address, valueToWrite, size = 4) {
    VarSetCapacity(processhandle, 32, 0)
    VarSetCapacity(value, 32, 0)
    NumPut(valueToWrite, value, 0, "UInt")  ; Initialize value as UInt
    processhandle := DllCall("OpenProcess", "UInt", 0x001F0FFF, "Int", 0, "Int", pid, "Ptr")
    Bvar := DllCall("WriteProcessMemory", "Ptr", processhandle, "Ptr", address+0, "Ptr", &value, "UInt", size, "UInt", 0)
    DllCall("CloseHandle", "Ptr", processHandle)
}

HexToFloat(d) {
    Return (1-2*(d>>31)) * (2**((d>>23 & 255)-127)) * (1+(d & 8388607)/8388608)
}


FloatToHex(f) {
    form := A_FormatInteger
    SetFormat Integer, HEX
    v := DllCall("MulDiv", Float,f, Int,1, Int,1, UInt)
    SetFormat Integer, %form%
    Return v
}

xor(byte4, encKey) {
    return byte4 ^ encKey
}

convert(value) {
    NumPut(value, bytes := "", "Float")
    return  NumGet(bytes, 0, "UInt")
}

F10::
    TOGGLE := false
    SetTimer, skip, off
    stopint := 0
    ;gosub, SonicOff ;stay on, cuz why not?
    gosub, UncapOff
    gosub, NoclipOff
    gosub, AntiGravOff
    ;gosub, AntiAfkOff ;stay on, cuz why not?
    gosub, MountOff
    gosub, AutoAttackOff
    ;gosub, MapZoomOff ;stay on, cuz why not?
    ;gosub, ZoomOff ;stay on, cuz why not?
    ;gosub, OmniOff
    ;gosub, CamOff
    ;gosub, MineOff
    ;gosub, NoRenderOff
    Loop {
        stopint++
        WinGet, stoptroves, List, ahk_exe Trove.exe
        loop, %stoptroves% {
            stopId := stoptroves%A_Index%
            ControlSend, ,{w up}, ahk_id %stopId%
        }
        if(stopint > 10) {
            Break
        }
    }
Return


F11::
    TOGGLE := true

    IniRead, local_pointer, config.ini, Pointers, base
    IniRead, local_x_view, config.ini, Pointers, x_view
    IniRead, local_y_view, config.ini, Pointers, y_view

    IniRead, local_x_coord, config.ini, Pointers, x_coord
    IniRead, local_y_coord, config.ini, Pointers, y_coord
    IniRead, local_z_coord, config.ini, Pointers, z_coord

    IniRead, local_speed_pointer, config.ini, Pointers, speed_pointer

    IniRead, local_distance, config.ini, Followbot, distance
    IniRead, local_speed, config.ini, Followbot, speed

    IniRead, local_wid1, config.ini, Pointers, world_id_1
    IniRead, local_wid2, config.ini, Pointers, world_id_2

    pointer := local_pointer
    x_coord := local_x_coord
    y_coord := local_y_coord
    z_coord := local_z_coord
    distance := local_distance

    world_id_offset_string1 := local_wid1
    world_id_offset_string2 := local_wid2
    gosub, SonicOn  
    gosub, UncapOn
    gosub, NoclipOn
    gosub, AntiGravOn
    gosub, AntiAfkOn
    ;gosub, MountOn
    ;gosub, AutoAttackOn
    ;gosub, MapZoomOn
    ;gosub, ZoomOn
    ;gosub, OmniOn
    ;gosub, CamOn
    ;gosub, MineOn
    ;gosub, NoRenderOn
    SetTimer, skip, % local_speed * 1000
Return


SonicOn:
gosub, CheckTroveWindows
Loop % TroveAccs.Length(){
    TNoclipAddress := TroveAccs[a_index].mem.modulePatternScan(, SonicAOB*)
    TroveAccs[a_index].mem.writeBytes(TNoclipAddress,SonicNew)
}
return

SonicOff:
gosub, CheckTroveWindows
Loop % TroveAccs.Length(){
    TNoclipAddress := TroveAccs[a_index].mem.modulePatternScan(, SonicAOBe*)
    TroveAccs[a_index].mem.writeBytes(TNoclipAddress,SonicOC)
    TPID := TroveAccs[a_index].PID
}
Return

UncapOn:
gosub, CheckTroveWindows
Loop % TroveAccs.Length(){
    TUncapAddress := TroveAccs[a_index].mem.modulePatternScan(, UncapAOB*)
    TroveAccs[a_index].mem.writeBytes(TUncapAddress,UncapNew)
}
Return

UncapOff:
gosub, CheckTroveWindows
Loop % TroveAccs.Length(){
    TUncapAddress := TroveAccs[a_index].mem.modulePatternScan(, UncapAOBe*)
    TroveAccs[a_index].mem.writeBytes(TUncapAddress,UncapOC)
    TPID := TroveAccs[a_index].PID
}
Return

NoClipOn:
gosub, CheckTroveWindows
Loop % TroveAccs.Length(){
    Id := TroveAccs[A_Index].hwnd
    if(!WinActive("ahk_id " . Id)){
        TNoclippAddress := TroveAccs[a_index].mem.modulePatternScan(, NoclipAOB*)
        TroveAccs[a_index].mem.writeBytes(TNoclippAddress,NoclipNew)
    }
}
Return

NoClipOff:
gosub, CheckTroveWindows
Loop % TroveAccs.Length(){
    TNoclippAddress := TroveAccs[a_index].mem.modulePatternScan(, NoclipAOBe*)
    TroveAccs[a_index].mem.writeBytes(TNoclippAddress,NoclipOC)
    TPID := TroveAccs[a_index].PID
}
Return

AntiGravOn:
gosub, CheckTroveWindows
Loop % TroveAccs.Length(){
    Id := TroveAccs[A_Index].hwnd
    if(!WinActive("ahk_id " . Id)){
        TAntiGravAddress := TroveAccs[a_index].mem.modulePatternScan(, AntiGravAOB*)
        TroveAccs[a_index].mem.writeBytes(TAntiGravAddress,AntiGravNew)
    }
}
Return

AntiGravOff:
gosub, CheckTroveWindows
Loop % TroveAccs.Length(){
    TAntiGravAddress := TroveAccs[a_index].mem.modulePatternScan(, AntiGravAOBe*)
    TroveAccs[a_index].mem.writeBytes(TAntiGravAddress,AntiGravOC)
    TPID := TroveAccs[a_index].PID
}
Return

AutoLootOn:
gosub, CheckTroveWindows
Loop % TroveAccs.Length(){
    TLootAddress := TroveAccs[a_index].mem.modulePatternScan(, LootAOB*)
    TroveAccs[a_index].mem.writeBytes(TLootAddress,LootNew)
}
Return

AutoLootOff:
gosub, CheckTroveWindows
Loop % TroveAccs.Length(){
    TLootAddress := TroveAccs[a_index].mem.modulePatternScan(, LootAOBe*)
    TroveAccs[a_index].mem.writeBytes(TLootAddress,LootOC)
    TPID := TroveAccs[a_index].PID
}
Return

AntiAfkOn:
gosub, CheckTroveWindows
Loop % TroveAccs.Length(){
    TAntiAfkAddress := TroveAccs[a_index].mem.modulePatternScan(, AntiAfkAOB*)
    TroveAccs[a_index].mem.writeBytes(TAntiAfkAddress,AntiAfkNew)
}
Return

AntiAfkOff:
gosub, CheckTroveWindows
Loop % TroveAccs.Length(){
    TAntiAfkAddress := TroveAccs[a_index].mem.modulePatternScan(, AntiAfkAOBe*)
    TroveAccs[a_index].mem.writeBytes(TAntiAfkAddress,AntiAfkOC)
    TPID := TroveAccs[a_index].PID
}
Return

MountOn:
gosub, CheckTroveWindows
Loop % TroveAccs.Length(){
    Id := TroveAccs[A_Index].hwnd
    if(!WinActive("ahk_id " . Id)){
        TMountAddress := TroveAccs[a_index].mem.modulePatternScan(, MountAOB*)
        TroveAccs[a_index].mem.writeBytes(TMountAddress,MountNew)
    }
}
Return

MountOff:
gosub, CheckTroveWindows
Loop % TroveAccs.Length(){
    TMountAddress := TroveAccs[a_index].mem.modulePatternScan(, MountAOBe*)
    TroveAccs[a_index].mem.writeBytes(TMountAddress,MountOC)
    TPID := TroveAccs[a_index].PID
}
Return

AutoAttackOn:
gosub, CheckTroveWindows
Loop % TroveAccs.Length(){
    Id := TroveAccs[A_Index].hwnd
    if(!WinActive("ahk_id " . Id)){
        TAttackAddress := TroveAccs[a_index].mem.modulePatternScan(, AttackAOB*)
        TroveAccs[a_index].mem.writeBytes(TAttackAddress,AttackNew)
    }
}
Return

AutoAttackOff:
gosub, CheckTroveWindows
Loop % TroveAccs.Length(){
    TAttackAddress := TroveAccs[a_index].mem.modulePatternScan(, AttackAOBe*)
    TroveAccs[a_index].mem.writeBytes(TAttackAddress,AttackOC)
    TPID := TroveAccs[a_index].PID
    ControlSend, ahk_parent, hhh, ahk_pid %TPID%
}
Return

MapZoomOn:
gosub, CheckTroveWindows
Loop % TroveAccs.Length(){
    TMapZoomAddress := TroveAccs[a_index].mem.modulePatternScan(, MapZoomAOB*)
    TroveAccs[a_index].mem.writeBytes(TMapZoomAddress,MapZoomNew)
}
Return

MapZoomOff:
gosub, CheckTroveWindows
Loop % TroveAccs.Length(){
    TMapZoomAddress := TroveAccs[a_index].mem.modulePatternScan(, MapZoomAOBe*)
    TroveAccs[a_index].mem.writeBytes(TMapZoomAddress,MapZoomOC)
    TPID := TroveAccs[a_index].PID
}
Return

ZoomOn:
gosub, CheckTroveWindows
Loop % TroveAccs.Length(){
    TZoomAddress := TroveAccs[a_index].mem.modulePatternScan(, ZoomAOB*)
    TroveAccs[a_index].mem.writeBytes(TZoomAddress,ZoomNew)
}
Return

ZoomOff:
gosub, CheckTroveWindows
Loop % TroveAccs.Length(){
    TZoomAddress := TroveAccs[a_index].mem.modulePatternScan(, ZoomAOBe*)
    TroveAccs[a_index].mem.writeBytes(TZoomAddress,ZoomOC)
    TPID := TroveAccs[a_index].PID
}
Return

OmniOn:
gosub, CheckTroveWindows
Loop % TroveAccs.Length(){
    TOmniAddress := TroveAccs[a_index].mem.modulePatternScan(, OmniAOB*)
    TroveAccs[a_index].mem.writeBytes(TOmniAddress,OmniNew)
}
Return

OmniOff:
gosub, CheckTroveWindows
Loop % TroveAccs.Length(){
    TOmniAddress := TroveAccs[a_index].mem.modulePatternScan(, OmniAOBe*)
    TroveAccs[a_index].mem.writeBytes(TOmniAddress,OmniOC)
    TPID := TroveAccs[a_index].PID
}
Return

CamOn:
gosub, CheckTroveWindows
Loop % TroveAccs.Length(){
    TCamAddress := TroveAccs[a_index].mem.modulePatternScan(, CamAOB*)
    TroveAccs[a_index].mem.writeBytes(TCamAddress,CamNew)
}
Return

CamOff:
gosub, CheckTroveWindows
Loop % TroveAccs.Length(){
    TCamAddress := TroveAccs[a_index].mem.modulePatternScan(, CamAOBe*)
    TroveAccs[a_index].mem.writeBytes(TCamAddress,CamOC)
    TPID := TroveAccs[a_index].PID
}
Return

MineOn:
gosub, CheckTroveWindows
Loop % TroveAccs.Length(){
    TMineAddress := TroveAccs[a_index].mem.modulePatternScan(, MineAOB*)
    TroveAccs[a_index].mem.writeBytes(TMineAddress,MineNew)
}
Return

MineOff:
gosub, CheckTroveWindows
Loop % TroveAccs.Length(){
    TMineAddress := TroveAccs[a_index].mem.modulePatternScan(, MineAOBe*)
    TroveAccs[a_index].mem.writeBytes(TMineAddress,MineOC)
    TPID := TroveAccs[a_index].PID
}
Return

NoRenderOn:
gosub, CheckTroveWindows
Loop % TroveAccs.Length(){
    TNoRenderAddress := TroveAccs[a_index].mem.modulePatternScan(, NoRenderAOB*)
    TroveAccs[a_index].mem.writeBytes(TNoRenderAddress,NoRenderNew)
}
Return

NoRenderOff:
gosub, CheckTroveWindows
Loop % TroveAccs.Length(){
    TNoRenderAddress := TroveAccs[a_index].mem.modulePatternScan(, NoRenderAOBe*)
    TroveAccs[a_index].mem.writeBytes(TNoRenderAddress,NoRenderOC)
    TPID := TroveAccs[a_index].PID
}
Return

CheckTroveWindows:
WinGet, winList, List, ahk_exe Trove.exe
Loop % TroveAccs.Length(){
    TroveAccs[a_index] := ""
}
TroveAccs := []
Loop % winList{
    WinGet, MPID, PID, % "ahk_id " winList%a_index%
    TroveAccs[a_index] := CreateTroveInstants(MPID, winList%a_index%)
}
oldWinList := winList
return

CreateTroveInstants(PID, id)
{
Obj := {}
Base := getProcessBaseAddress(id)
Obj.hwnd := id
Obj.PID := PID
Obj.mem := new _ClassMemoryy("ahk_pid " PID, "", hProcess)
WinGetTitle, tmpTit, ahk_pid %PID%
Obj.title := tmpTit
global PlayerBase
return Obj
}


ReadMemoryy(MADDRESS, pid, size = 4) {
    VarSetCapacity(MVALUE, size, 0)
    ProcessHandle := DllCall("OpenProcess", "Int", 24, "Char", 0, "UInt", pid, "UInt")
    DllCall("ReadProcessMemory", "UInt", ProcessHandle, "Ptr", MADDRESS, "Ptr", &MVALUE, "Uint", size)
        result := 0  ; Initialize result to zero
    Loop %size%
        result += *(&MVALUE + A_Index-1) << 8*(A_Index-1)
    if (size == 1 && result & 0x80)
        result -= 0x100
    else if (size == 2 && result & 0x8000)
        result -= 0x10000
    else if (size == 4 && result & 0x80000000)
        result -= 0x100000000

    Return result
}

refreshMemoryClass:
if (oldPid != PID){
mem := new _ClassMemoryy("ahk_pid " PID, "", hProcess)
AttackAddress := mem.modulePatternScan(, SonicAOB*)
}
oldPID := PID
SetTimer, refreshMemoryClass, -1000
return




class _ClassMemoryy
{
static baseAddress, hProcess, PID, currentProgram
, insertNullTerminator := True
, readStringLastError := False
, isTarget64bit := False
, ptrType := "UInt"
, aTypeSize := { "UChar": 1, "Char": 1
, "UShort": 2, "Short": 2
, "UInt": 4, "Int": 4
, "UFloat": 4, "Float": 4
, "Int64": 8, "Double": 8}
, aRights := { "PROCESS_ALL_ACCESS": 0x001F0FFF
, "PROCESS_CREATE_PROCESS": 0x0080
, "PROCESS_CREATE_THREAD": 0x0002
, "PROCESS_DUP_HANDLE": 0x0040
, "PROCESS_QUERY_INFORMATION": 0x0400
, "PROCESS_QUERY_LIMITED_INFORMATION": 0x1000
, "PROCESS_SET_INFORMATION": 0x0200
, "PROCESS_SET_QUOTA": 0x0100
, "PROCESS_SUSPEND_RESUME": 0x0800
, "PROCESS_TERMINATE": 0x0001
, "PROCESS_VM_OPERATION": 0x0008
, "PROCESS_VM_READ": 0x0010
, "PROCESS_VM_WRITE": 0x0020
, "SYNCHRONIZE": 0x00100000}
__new(program, dwDesiredAccess := "", byRef handle := "", windowMatchMode := 3)
{
if this.PID := handle := this.findPID(program, windowMatchMode)
{
if dwDesiredAccess is not integer
dwDesiredAccess := this.aRights.PROCESS_QUERY_INFORMATION | this.aRights.PROCESS_VM_OPERATION | this.aRights.PROCESS_VM_READ | this.aRights.PROCESS_VM_WRITE
dwDesiredAccess |= this.aRights.SYNCHRONIZE
if this.hProcess := handle := this.OpenProcess(this.PID, dwDesiredAccess)
{
this.pNumberOfBytesRead := DllCall("GlobalAlloc", "UInt", 0x0040, "Ptr", A_PtrSize, "Ptr")
this.pNumberOfBytesWritten := DllCall("GlobalAlloc", "UInt", 0x0040, "Ptr", A_PtrSize, "Ptr")
this.readStringLastError := False
this.currentProgram := program
if this.isTarget64bit := this.isTargetProcess64Bit(this.PID, this.hProcess, dwDesiredAccess)
this.ptrType := "Int64"
else this.ptrType := "UInt"
if (A_PtrSize != 4 || !this.isTarget64bit)
this.BaseAddress := this.getModuleBaseAddress()
if this.BaseAddress < 0 || !this.BaseAddress
this.BaseAddress := this.getProcessBaseAddress(program, windowMatchMode)
return this
}
}
return
}
__delete()
{
this.closeHandle(this.hProcess)
if this.pNumberOfBytesRead
DllCall("GlobalFree", "Ptr", this.pNumberOfBytesRead)
if this.pNumberOfBytesWritten
DllCall("GlobalFree", "Ptr", this.pNumberOfBytesWritten)
return
}
CreateRemoteThread(pRemoteAddress)
{
return DllCall("CreateRemoteThread", "Ptr", this.hProcess, "Ptr", 0, "Ptr", 0, "Ptr", pRemoteAddress, "Ptr", 0, "Ptr", 0, "Ptr", 0)
}
VirtualAllocEx(pSize)
{
return DllCall("VirtualAllocEx", "Ptr", this.hProcess, "Ptr", 0, "Ptr", pSize, "Ptr", 0x1000, "Ptr", 0x40)
}
VirtualFreeEx(pAddress, pSize)
{
return DllCall("VirtualFreeEx", "Ptr", this.hProcess, "Ptr", pAddress, "Ptr", pSize, "Ptr", 0x4000)
}
memoryJmp(pDestination, pAddress:="", Byte:=5){
ByteJump := this.getBytejmp(pDestination, pAddress)
if (Byte == 5)
byte2write := "E9" . ByteJump
if (Byte == 6)
byte2write := "E9" . ByteJump . "90"
if (Byte == 7)
byte2write := "E9" . ByteJump . "66" . "90"
return this.writeBytes(pAddress, byte2write)
}
getByteJmp(pDestination, pAddress:=""){
if (pAddress == ""){
OffsetArray := StrSplit(this.hex(pDestination))
HexString := OffsetArray[7] OffsetArray[8] OffsetArray[5] OffsetArray[6] OffsetArray[3] OffsetArray[4] OffsetArray[1] OffsetArray[2]
Trim(HexString)
while (StrLen(HexString) < 8){
HexString := HexString . "0"
}
return HexString
} else {
Offset := pDestination-(pAddress+5)
OffsetArray := StrSplit(this.hex(Offset))
HexString := OffsetArray[7] OffsetArray[8] OffsetArray[5] OffsetArray[6] OffsetArray[3] OffsetArray[4] OffsetArray[1] OffsetArray[2]
Trim(HexString)
while (StrLen(HexString) < 8){
HexString := HexString . "0"
}
return HexString
}
}
hex(int)
{
HEX_INT := 8
while (HEX_INT--)
{
n := (int >> (HEX_INT * 4)) & 0xf
h .= n > 9 ? chr(0x37 + n) : n
if (HEX_INT == 0 && HEX_INT//2 == 0)
h .= " "
}
return (String)h
}
version()
{
return 2.92
}
findPID(program, windowMatchMode := "3", num := -1)
{
if RegExMatch(program, "i)\s*AHK_PID\s+(0x[[:xdigit:]]+|\d+)", pid)
return pid1
if windowMatchMode
{
mode := A_TitleMatchMode
StringReplace, windowMatchMode, windowMatchMode, 0x
SetTitleMatchMode, %windowMatchMode%
}
WinGet, pid, pid, %program%
if windowMatchMode
SetTitleMatchMode, %mode%
if (!pid && RegExMatch(program, "i)\bAHK_EXE\b\s*(.*)", fileName))
{
filename := RegExReplace(filename1, "i)\bahk_(class|id|pid|group)\b.*", "")
filename := trim(filename)
SplitPath, fileName , fileName
if (fileName)
{
arid:=[]
len:=0
s := VarSetCapacity(a, 4096)
DllCall("Psapi.dllEnumProcesses", "Ptr", &a, "UInt", s, "UIntP", r)
Loop, % r // 4
{
id := NumGet(a, A_Index * 4, "UInt")
if h := DllCall("OpenProcess", "UInt", 0x0410, "Int", false, "UInt", id, "Ptr")
{
VarSetCapacity(name, s, 0)
DllCall("Psapi.dllGetModuleBaseName", "Ptr", h, "Ptr", 0, "Str", name, "UInt", A_IsUnicode ? s//2 : s)
DllCall("CloseHandle", "Ptr", h)
if (name=fileName){
hProc := DllCall("OpenProcess", "Ptr", 0x400, "Ptr", 0, "Ptr", id)
DllCall("kernel32GetProcessTimes", "Ptr",hProc, "Int64*",vIntervalsUTC, "Ptr",0, "Ptr",0, "Ptr",0)
DllCall("CloseHandle", "Ptr", hProc)
arid[vIntervalsUTC]:=id
len+=1
}
}
}
DllCall("FreeLibrary", "Ptr", hModule)
c := (num < 0? len + mod(num, len) : mod(num - 1, len)) + 1
for k, v in arid
if (A_Index = c)
return v
}
}
return pid ? pid : 0
}
isHandleValid()
{
return 0x102 = DllCall("WaitForSingleObject", "Ptr", this.hProcess, "UInt", 0)
}
openProcess(PID, dwDesiredAccess)
{
r := DllCall("OpenProcess", "UInt", dwDesiredAccess, "Int", False, "UInt", PID, "Ptr")
if (!r && A_LastError = 5)
{
this.setSeDebugPrivilege(true)
if (r2 := DllCall("OpenProcess", "UInt", dwDesiredAccess, "Int", False, "UInt", PID, "Ptr"))
return r2
DllCall("SetLastError", "UInt", 5)
}
return r ? r : ""
}
closeHandle(hProcess)
{
return DllCall("CloseHandle", "Ptr", hProcess)
}
numberOfBytesRead()
{
return !this.pNumberOfBytesRead ? -1 : NumGet(this.pNumberOfBytesRead+0, "Ptr")
}
numberOfBytesWritten()
{
return !this.pNumberOfBytesWritten ? -1 : NumGet(this.pNumberOfBytesWritten+0, "Ptr")
}
read(address, type := "UInt", aOffsets*)
{
if !this.aTypeSize.hasKey(type)
return "", ErrorLevel := -2
if DllCall("ReadProcessMemory", "Ptr", this.hProcess, "Ptr", aOffsets.maxIndex() ? this.getAddressFromOffsets(address, aOffsets*) : address, type "*", result, "Ptr", this.aTypeSize[type], "Ptr", this.pNumberOfBytesRead)
return result
return
}
readRaw(address, byRef buffer, bytes := 4, aOffsets*)
{
VarSetCapacity(buffer, bytes)
return DllCall("ReadProcessMemory", "Ptr", this.hProcess, "Ptr", aOffsets.maxIndex() ? this.getAddressFromOffsets(address, aOffsets*) : address, "Ptr", &buffer, "Ptr", bytes, "Ptr", this.pNumberOfBytesRead)
}
readString(address, sizeBytes := 0, encoding := "UTF-8", aOffsets*)
{
bufferSize := VarSetCapacity(buffer, sizeBytes ? sizeBytes : 100, 0)
this.ReadStringLastError := False
if aOffsets.maxIndex()
address := this.getAddressFromOffsets(address, aOffsets*)
if !sizeBytes
{
if (encoding = "utf-16" || encoding = "cp1200")
encodingSize := 2, charType := "UShort", loopCount := 2
else encodingSize := 1, charType := "Char", loopCount := 4
Loop
{
if !DllCall("ReadProcessMemory", "Ptr", this.hProcess, "Ptr", address + ((outterIndex := A_index) - 1) * 4, "Ptr", &buffer, "Ptr", 4, "Ptr", this.pNumberOfBytesRead) || ErrorLevel
return "", this.ReadStringLastError := True
else loop, %loopCount%
{
if NumGet(buffer, (A_Index - 1) * encodingSize, charType) = 0
{
if (bufferSize < sizeBytes := outterIndex * 4 - (4 - A_Index * encodingSize))
VarSetCapacity(buffer, sizeBytes)
break, 2
}
}
}
}
if DllCall("ReadProcessMemory", "Ptr", this.hProcess, "Ptr", address, "Ptr", &buffer, "Ptr", sizeBytes, "Ptr", this.pNumberOfBytesRead)
return StrGet(&buffer,, encoding)
return "", this.ReadStringLastError := True
}
writeString(address, string, encoding := "utf-8", aOffsets*)
{
encodingSize := (encoding = "utf-16" || encoding = "cp1200") ? 2 : 1
requiredSize := StrPut(string, encoding) * encodingSize - (this.insertNullTerminator ? 0 : encodingSize)
VarSetCapacity(buffer, requiredSize)
StrPut(string, &buffer, StrLen(string) + (this.insertNullTerminator ? 1 : 0), encoding)
return DllCall("WriteProcessMemory", "Ptr", this.hProcess, "Ptr", aOffsets.maxIndex() ? this.getAddressFromOffsets(address, aOffsets*) : address, "Ptr", &buffer, "Ptr", requiredSize, "Ptr", this.pNumberOfBytesWritten)
}
write(address, value, type := "Uint", aOffsets*)
{
if !this.aTypeSize.hasKey(type)
return "", ErrorLevel := -2
sizeBytes := this.aTypeSize[type]
if DllCall("WriteProcessMemory", "Ptr", this.hProcess, "Ptr", aOffsets.maxIndex() ? this.getAddressFromOffsets(address, aOffsets*) : address, type "*", value, "Ptr", sizeBytes, "Ptr", this.pNumberOfBytesWritten)
return address + sizeBytes
}
writeRaw(address, pBuffer, sizeBytes, aOffsets*)
{
if DllCall("WriteProcessMemory", "Ptr", this.hProcess, "Ptr", aOffsets.maxIndex() ? this.getAddressFromOffsets(address, aOffsets*) : address, "Ptr", pBuffer, "Ptr", sizeBytes, "Ptr", this.pNumberOfBytesWritten)
return address + sizeBytes
}


writeBytes(address, hexStringOrByteArray, aOffsets*)
{
if !IsObject(hexStringOrByteArray)
{
if !IsObject(hexStringOrByteArray := this.hexStringToPattern(hexStringOrByteArray))
return hexStringOrByteArray
}
sizeBytes := this.getNeedleFromAOBPattern("", buffer, hexStringOrByteArray*)
return this.writeRaw(address, &buffer, sizeBytes, aOffsets*)
}


pointer(address, finalType := "UInt", offsets*)
{
For index, offset in offsets
address := this.Read(address, this.ptrType) + offset
Return this.Read(address, finalType)
}
getAddressFromOffsets(address, aOffsets*)
{
return aOffsets.Remove() + this.pointer(address, this.ptrType, aOffsets*)
}
getProcessBaseAddress(windowTitle, windowMatchMode := "3")
{
if (windowMatchMode && A_TitleMatchMode != windowMatchMode)
{
mode := A_TitleMatchMode
StringReplace, windowMatchMode, windowMatchMode, 0x
SetTitleMatchMode, %windowMatchMode%
}
WinGet, hWnd, ID, %WindowTitle%
if mode
SetTitleMatchMode, %mode%
if !hWnd
return
return DllCall(A_PtrSize = 4
? "GetWindowLong"
: "GetWindowLongPtr"
, "Ptr", hWnd, "Int", -6, A_Is64bitOS ? "Int64" : "UInt")
}
getDllBaseAddress(moduleName)
{
hS := DllCall("CreateToolhelp32Snapshot", "UInt", 0x18, "UInt", this.PID)
NumPut(VarSetCapacity(me, (A_PtrSize = 8 ? 568 : 548), 0), me, "UInt")
ModuleAdd:=DllCall("Module32First", "ptr", hS, "ptr", &me)
while (ModuleAdd)
{
if (ModuleName = StrGet(&me+ (A_PtrSize = 8 ? 48 : 32), 256, "cp0"))
{
DllCall("CloseHandle", "ptr", hS)
return NumGet(me, (A_PtrSize = 8 ? 24 : 20), "uptr")
}
ModuleAdd:=DllCall("Module32Next", "ptr", hS, "ptr", &me)
}
}
getModuleBaseAddress(moduleName := "", byRef aModuleInfo := "")
{
aModuleInfo := ""
if (moduleName = "")
moduleName := this.GetModuleFileNameEx(0, True)
if r := this.getModules(aModules, True) < 0
return r
return aModules.HasKey(moduleName) ? (aModules[moduleName].lpBaseOfDll, aModuleInfo := aModules[moduleName]) : -1
}
getModuleFromAddress(address, byRef aModuleInfo, byRef offsetFromModuleBase := "")
{
aModuleInfo := offsetFromModule := ""
if result := this.getmodules(aModules) < 0
return result
for k, module in aModules
{
if (address >= module.lpBaseOfDll && address < module.lpBaseOfDll + module.SizeOfImage)
return 1, aModuleInfo := module, offsetFromModuleBase := address - module.lpBaseOfDll
}
return -1
}
setSeDebugPrivilege(enable := True)
{
h := DllCall("OpenProcess", "UInt", 0x0400, "Int", false, "UInt", DllCall("GetCurrentProcessId"), "Ptr")
DllCall("Advapi32.dll\OpenProcessToken", "Ptr", h, "UInt", 32, "PtrP", t)
VarSetCapacity(ti, 16, 0)
NumPut(1, ti, 0, "UInt")
DllCall("Advapi32.dll\LookupPrivilegeValue", "Ptr", 0, "Str", "SeDebugPrivilege", "Int64P", luid)
NumPut(luid, ti, 4, "Int64")
if enable
NumPut(2, ti, 12, "UInt")
r := DllCall("Advapi32.dll\AdjustTokenPrivileges", "Ptr", t, "Int", false, "Ptr", &ti, "UInt", 0, "Ptr", 0, "Ptr", 0)
DllCall("CloseHandle", "Ptr", t)
DllCall("CloseHandle", "Ptr", h)
return r
}
isTargetProcess64Bit(PID, hProcess := "", currentHandleAccess := "")
{
if !A_Is64bitOS
return False
else if !hProcess || !(currentHandleAccess & (this.aRights.PROCESS_QUERY_INFORMATION | this.aRights.PROCESS_QUERY_LIMITED_INFORMATION))
closeHandle := hProcess := this.openProcess(PID, this.aRights.PROCESS_QUERY_INFORMATION)
if (hProcess && DllCall("IsWow64Process", "Ptr", hProcess, "Int*", Wow64Process))
result := !Wow64Process
return result, closeHandle ? this.CloseHandle(hProcess) : ""
}
suspend()
{
return DllCall("ntdll\NtSuspendProcess", "Ptr", this.hProcess)
}
resume()
{
return DllCall("ntdll\NtResumeProcess", "Ptr", this.hProcess)
}
getModules(byRef aModules, useFileNameAsKey := False)
{
if (A_PtrSize = 4 && this.IsTarget64bit)
return -4
aModules := []
if !moduleCount := this.EnumProcessModulesEx(lphModule)
return -3
loop % moduleCount
{
this.GetModuleInformation(hModule := numget(lphModule, (A_index - 1) * A_PtrSize), aModuleInfo)
aModuleInfo.Name := this.GetModuleFileNameEx(hModule)
filePath := aModuleInfo.name
SplitPath, filePath, fileName
aModuleInfo.fileName := fileName
if useFileNameAsKey
aModules[fileName] := aModuleInfo
else aModules.insert(aModuleInfo)
}
return moduleCount
}
getEndAddressOfLastModule(byRef aModuleInfo := "")
{
if !moduleCount := this.EnumProcessModulesEx(lphModule)
return -3
hModule := numget(lphModule, (moduleCount - 1) * A_PtrSize)
if this.GetModuleInformation(hModule, aModuleInfo)
return aModuleInfo.lpBaseOfDll + aModuleInfo.SizeOfImage
return -5
}
GetModuleFileNameEx(hModule := 0, fileNameNoPath := False)
{
VarSetCapacity(lpFilename, 2048 * (A_IsUnicode ? 2 : 1))
DllCall("psapi\GetModuleFileNameEx"
, "Ptr", this.hProcess
, "Ptr", hModule
, "Str", lpFilename
, "Uint", 2048 / (A_IsUnicode ? 2 : 1))
if fileNameNoPath
SplitPath, lpFilename, lpFilename
return lpFilename
}
EnumProcessModulesEx(byRef lphModule, dwFilterFlag := 0x03)
{
lastError := A_LastError
size := VarSetCapacity(lphModule, 4)
loop
{
DllCall("psapi\EnumProcessModulesEx"
, "Ptr", this.hProcess
, "Ptr", &lphModule
, "Uint", size
, "Uint*", reqSize
, "Uint", dwFilterFlag)
if ErrorLevel
return 0
else if (size >= reqSize)
break
else size := VarSetCapacity(lphModule, reqSize)
}
DllCall("SetLastError", "UInt", lastError)
return reqSize // A_PtrSize
}
GetModuleInformation(hModule, byRef aModuleInfo)
{
VarSetCapacity(MODULEINFO, A_PtrSize * 3), aModuleInfo := []
return DllCall("psapi\GetModuleInformation"
, "Ptr", this.hProcess
, "Ptr", hModule
, "Ptr", &MODULEINFO
, "UInt", A_PtrSize * 3)
, aModuleInfo := { lpBaseOfDll: numget(MODULEINFO, 0, "Ptr")
, SizeOfImage: numget(MODULEINFO, A_PtrSize, "UInt")
, EntryPoint: numget(MODULEINFO, A_PtrSize * 2, "Ptr") }
}
hexStringToPattern(hexString)
{
AOBPattern := []
hexString := RegExReplace(hexString, "(\s|0x)")
StringReplace, hexString, hexString, ?, ?, UseErrorLevel
wildCardCount := ErrorLevel
if !length := StrLen(hexString)
return -1
else if RegExMatch(hexString, "[^0-9a-fA-F?]")
return -2
else if Mod(wildCardCount, 2)
return -3
else if Mod(length, 2)
return -4
loop, % length/2
{
value := "0x" SubStr(hexString, 1 + 2 * (A_index-1), 2)
AOBPattern.Insert(value + 0 = "" ? "?" : value)
}
return AOBPattern
}
stringToPattern(string, encoding := "UTF-8", insertNullTerminator := False)
{
if !length := StrLen(string)
return -1
AOBPattern := []
encodingSize := (encoding = "utf-16" || encoding = "cp1200") ? 2 : 1
requiredSize := StrPut(string, encoding) * encodingSize - (insertNullTerminator ? 0 : encodingSize)
VarSetCapacity(buffer, requiredSize)
StrPut(string, &buffer, length + (insertNullTerminator ? 1 : 0), encoding)
loop, % requiredSize
AOBPattern.Insert(NumGet(buffer, A_Index-1, "UChar"))
return AOBPattern
}


modulePatternScan(module := "", aAOBPattern*)
{
MEM_COMMIT := 0x1000, MEM_MAPPED := 0x40000, MEM_PRIVATE := 0x20000
, PAGE_NOACCESS := 0x01, PAGE_GUARD := 0x100
if (result := this.getModuleBaseAddress(module, aModuleInfo)) <= 0
return "", ErrorLevel := result
if !patternSize := this.getNeedleFromAOBPattern(patternMask, AOBBuffer, aAOBPattern*)
return -10
if (result := this.PatternScan(aModuleInfo.lpBaseOfDll, aModuleInfo.SizeOfImage, patternMask, AOBBuffer)) >= 0
return result
address := aModuleInfo.lpBaseOfDll
endAddress := address + aModuleInfo.SizeOfImage
loop
{
if !this.VirtualQueryEx(address, aRegion)
return -9
if (aRegion.State = MEM_COMMIT
&& !(aRegion.Protect & (PAGE_NOACCESS | PAGE_GUARD))
&& aRegion.RegionSize >= patternSize
&& (result := this.PatternScan(address, aRegion.RegionSize, patternMask, AOBBuffer)) > 0)
return result
} until (address += aRegion.RegionSize) >= endAddress
return 0
}


addressPatternScan(startAddress, sizeOfRegionBytes, aAOBPattern*)
{
if !this.getNeedleFromAOBPattern(patternMask, AOBBuffer, aAOBPattern*)
return -10
return this.PatternScan(startAddress, sizeOfRegionBytes, patternMask, AOBBuffer)
}
processPatternScan(startAddress := 0, endAddress := "", aAOBPattern*)
{
address := startAddress
if endAddress is not integer
endAddress := this.isTarget64bit ? (A_PtrSize = 8 ? 0x7FFFFFFFFFF : 0xFFFFFFFF) : 0x7FFFFFFF
MEM_COMMIT := 0x1000, MEM_MAPPED := 0x40000, MEM_PRIVATE := 0x20000
PAGE_NOACCESS := 0x01, PAGE_GUARD := 0x100
if !patternSize := this.getNeedleFromAOBPattern(patternMask, AOBBuffer, aAOBPattern*)
return -10
while address <= endAddress
{
if !this.VirtualQueryEx(address, aInfo)
return -1
if A_Index = 1
aInfo.RegionSize -= address - aInfo.BaseAddress
if (aInfo.State = MEM_COMMIT)
&& !(aInfo.Protect & (PAGE_NOACCESS | PAGE_GUARD))
&& aInfo.RegionSize >= patternSize
&& (result := this.PatternScan(address, aInfo.RegionSize, patternMask, AOBBuffer))
{
if result < 0
return -2
else if (result + patternSize - 1 <= endAddress)
return result
else return 0
}
address += aInfo.RegionSize
}
return 0
}
rawPatternScan(byRef buffer, sizeOfBufferBytes := "", startOffset := 0, aAOBPattern*)
{
if !this.getNeedleFromAOBPattern(patternMask, AOBBuffer, aAOBPattern*)
return -10
if (sizeOfBufferBytes + 0 = "" || sizeOfBufferBytes <= 0)
sizeOfBufferBytes := VarSetCapacity(buffer)
if (startOffset + 0 = "" || startOffset < 0)
startOffset := 0
return this.bufferScanForMaskedPattern(&buffer, sizeOfBufferBytes, patternMask, &AOBBuffer, startOffset)
}
getNeedleFromAOBPattern(byRef patternMask, byRef needleBuffer, aAOBPattern*)
{
patternMask := "", VarSetCapacity(needleBuffer, aAOBPattern.MaxIndex())
for i, v in aAOBPattern
patternMask .= (v + 0 = "" ? "?" : "x"), NumPut(round(v), needleBuffer, A_Index - 1, "UChar")
return round(aAOBPattern.MaxIndex())
}
VirtualQueryEx(address, byRef aInfo)
{
if (aInfo.__Class != "_ClassMemory._MEMORY_BASIC_INFORMATION")
aInfo := new this._MEMORY_BASIC_INFORMATION()
return aInfo.SizeOfStructure = DLLCall("VirtualQueryEx"
, "Ptr", this.hProcess
, "Ptr", address
, "Ptr", aInfo.pStructure
, "Ptr", aInfo.SizeOfStructure
, "Ptr")
}
patternScan(startAddress, sizeOfRegionBytes, byRef patternMask, byRef needleBuffer)
{
if !this.readRaw(startAddress, buffer, sizeOfRegionBytes)
return -1
if (offset := this.bufferScanForMaskedPattern(&buffer, sizeOfRegionBytes, patternMask, &needleBuffer)) >= 0
return startAddress + offset
else return 0
}
bufferScanForMaskedPattern(hayStackAddress, sizeOfHayStackBytes, byRef patternMask, needleAddress, startOffset := 0)
{
static p
if !p
{
if A_PtrSize = 4
p := this.MCode("1,x86:8B44240853558B6C24182BC5568B74242489442414573BF0773E8B7C241CBB010000008B4424242BF82BD8EB038D49008B54241403D68A0C073A0A740580383F750B8D0C033BCD74174240EBE98B442424463B74241876D85F5E5D83C8FF5BC35F8BC65E5D5BC3")
else
p := this.MCode("1,x64:48895C2408488974241048897C2418448B5424308BF2498BD8412BF1488BF9443BD6774A4C8B5C24280F1F800000000033C90F1F400066660F1F840000000000448BC18D4101418D4AFF03C80FB60C3941380C18740743803C183F7509413BC1741F8BC8EBDA41FFC2443BD676C283C8FF488B5C2408488B742410488B7C2418C3488B5C2408488B742410488B7C2418418BC2C3")
}
if (needleSize := StrLen(patternMask)) + startOffset > sizeOfHayStackBytes
return -1
if (sizeOfHayStackBytes > 0)
return DllCall(p, "Ptr", hayStackAddress, "UInt", sizeOfHayStackBytes, "Ptr", needleAddress, "UInt", needleSize, "AStr", patternMask, "UInt", startOffset, "cdecl int")
return -2
}
MCode(mcode)
{
static e := {1:4, 2:1}, c := (A_PtrSize=8) ? "x64" : "x86"
if !regexmatch(mcode, "^([0-9]+),(" c ":|.*?," c ":)([^,]+)", m)
return
if !DllCall("crypt32\CryptStringToBinary", "str", m3, "uint", 0, "uint", e[m1], "ptr", 0, "uint*", s, "ptr", 0, "ptr", 0)
return
p := DllCall("GlobalAlloc", "uint", 0, "ptr", s, "ptr")
DllCall("VirtualProtect", "ptr", p, "ptr", s, "uint", 0x40, "uint*", op)
if DllCall("crypt32\CryptStringToBinary", "str", m3, "uint", 0, "uint", e[m1], "ptr", p, "uint*", s, "ptr", 0, "ptr", 0)
return p
DllCall("GlobalFree", "ptr", p)
return
}
class _MEMORY_BASIC_INFORMATION
{
__new()
{
if !this.pStructure := DllCall("GlobalAlloc", "UInt", 0, "Ptr", this.SizeOfStructure := A_PtrSize = 8 ? 48 : 28, "Ptr")
return ""
return this
}
__Delete()
{
DllCall("GlobalFree", "Ptr", this.pStructure)
}
__get(key)
{
static aLookUp := A_PtrSize = 8
? { "BaseAddress": {"Offset": 0, "Type": "Int64"}
, "AllocationBase": {"Offset": 8, "Type": "Int64"}
, "AllocationProtect": {"Offset": 16, "Type": "UInt"}
, "RegionSize": {"Offset": 24, "Type": "Int64"}
, "State": {"Offset": 32, "Type": "UInt"}
, "Protect": {"Offset": 36, "Type": "UInt"}
, "Type": {"Offset": 40, "Type": "UInt"} }
: { "BaseAddress": {"Offset": 0, "Type": "UInt"}
, "AllocationBase": {"Offset": 4, "Type": "UInt"}
, "AllocationProtect": {"Offset": 8, "Type": "UInt"}
, "RegionSize": {"Offset": 12, "Type": "UInt"}
, "State": {"Offset": 16, "Type": "UInt"}
, "Protect": {"Offset": 20, "Type": "UInt"}
, "Type": {"Offset": 24, "Type": "UInt"} }
if aLookUp.HasKey(key)
return numget(this.pStructure+0, aLookUp[key].Offset, aLookUp[key].Type)
}
__set(key, value)
{
static aLookUp := A_PtrSize = 8
? { "BaseAddress": {"Offset": 0, "Type": "Int64"}
, "AllocationBase": {"Offset": 8, "Type": "Int64"}
, "AllocationProtect": {"Offset": 16, "Type": "UInt"}
, "RegionSize": {"Offset": 24, "Type": "Int64"}
, "State": {"Offset": 32, "Type": "UInt"}
, "Protect": {"Offset": 36, "Type": "UInt"}
, "Type": {"Offset": 40, "Type": "UInt"} }
: { "BaseAddress": {"Offset": 0, "Type": "UInt"}
, "AllocationBase": {"Offset": 4, "Type": "UInt"}
, "AllocationProtect": {"Offset": 8, "Type": "UInt"}
, "RegionSize": {"Offset": 12, "Type": "UInt"}
, "State": {"Offset": 16, "Type": "UInt"}
, "Protect": {"Offset": 20, "Type": "UInt"}
, "Type": {"Offset": 24, "Type": "UInt"} }
if aLookUp.HasKey(key)
{
NumPut(value, this.pStructure+0, aLookUp[key].Offset, aLookUp[key].Type)
return value
}
}
Ptr()
{
return this.pStructure
}
sizeOf()
{
return this.SizeOfStructure
}
}
}