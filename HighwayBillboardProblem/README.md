# Highway Billboard Problem
Consider a highway of M miles. The task is to place billboards on the highway such that revenue is maximized. The possible sites for billboards are given by number x(1) < x(2) < ….. < x(n-1) < x(n), specifying positions in miles measured from one end of the road. If we place a billboard at position x(i), we receive a revenue of r(i) > 0. There is a restriction that no two billboards can be placed within t miles or less than it.

Note : All possible sites from x(1) to x(n) are in range from 0 to M as need to place billboards on a highway of M miles.

Examples:



Input : M = 20
        x[]       = {6, 7, 12, 13, 14}
        revenue[] = {5, 6, 5,  3,  1}
        t = 5
Output: 10
By placing two billboards at 6 miles and 12
miles will produce the maximum revenue of 10.

Input : M = 15
        x[] = {6, 9, 12, 14}
        revenue[] = {5, 6, 3, 7}
        t = 2
Output : 18  

# Notes
- M, n, t : 8 bits.
- X, revenue : roms (255 x 8) bits.
- There are rom.vhd program helps the user to input x and revenue elements.
## Install

These examples use [ModelSim&reg; and Quartus&reg; Prime from Intel FPGA](http://fpgasoftware.intel.com/?edition=lite), [GIT](https://git-scm.com/download/win), [Visual Studio Code](https://code.visualstudio.com/download), make sure they are installed locally on your computer before proceeding.

## Usage

1. Grab a copy of this repository to your computer's local folder (i.e. C:\projects):

    ```sh
    $ cd projects
    $ git clone https://github.com/Salem22/HighwayBillboardProblem.git
    ```
2. Use Visual Studio Code (VSC) to edit and view the design files:

    ```sh
    $ cd HighwayBillboardProblem
    $ code .
    ```
    Click on the toplevel.vhd file in the left pane to view its contents.
    
3. From the VSC View menu, choose Terminal, in the VCS Terminal, create a "work" library:

    ```sh
    $ vlib work
    ```
    
4. Compile all the design units:

    ```sh
    $ vcom *.vhd
    ```
    
5. Simulate your design. For example, if M = 20, n = sizeof(x) = 5, t = 5, x = {6, 7, 12, 13, 14}, revenue = {5, 6, 5,  3,  1} then y = 10:
- The elements of x and revenue are specified in rom.vhd

    ```sh
    $ vsim work.tb
    ```
