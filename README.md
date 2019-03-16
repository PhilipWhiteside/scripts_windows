A collection of scripts I use in my PC setup when booted into Windows.

# Windows Tiling

- Scripts to arrange active windows into a tiled layout.
- Associate to a shortcut within the bottom of the script, or call this from another holding hotkeys.
- Values not static, monitor size is auto detected (thanks to shinywong http://www.autohotkey.com/board/topic/69464-how-to-determine-a-window-is-in-which-monitor/?p=440355)
- Layout is determined via:

| Hotkey         | Layout Script | 
|----------------|---------------|
| Super+1        | thin-left   |
| Super+2        | wide-center |
| Super+3        | thin-right  |
| Super+4        | wide-left   |
| Super+5        | wide-right  |
| Super+Shift+1  | thirds-1    |
| Super+Shift+2  | thirds-2    |
| Super+Shift+3  | thirds-3    |
| Super+Shift+4  | thirds-wide-left   |
| Super+Shift+5  | thirds-wide-right  |

## Example

```
TileActiveWindow(
   number of columns,  ( Number of columns in desired layout )
   starting column,    ( Starting inclusive column to place current window in )
   ending column,      ( Ending inclusive column to expand current window to )
   number of rows,     ( Number of rows in desired layout )
   starting row,       ( Starting inclusive rows to place current window in )
   ending row          ( Ending inclusive column to expand current window to )
)
```
```
#1::TileActiveWindow(3,0,1,1,0,1)
                     3-|-|-|-|-|---3 columns layout
                       0-|-|-|-|---start in column 0 
                         1-|-|-|---end in column 1
                           1-|-|---1 row layout
                             0-|---start in row 0
                               1---end in row 0
```


