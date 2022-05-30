Readme

Required software, 

To run all the models in this directory and generate HDL code, you need the following tools from the 2007b release, or later versions.

1)	MATLAB
2)	Simulink
3)	Signal Processing Toolbox
4)	Signal Processing Blockset
5)	Filter Design Toolbox
6)	Fixed-point toolbox
7)	Simulink fixed-point
8)	Simulink HDL Coder



LICENSE AND INFO:

For more information about the decimation filer and how to improve its performance please visit: 
     
    http://www.mathworks.it/company/newsletters/articles/designing-a-sigma-delta-adc-from-behavioral-model-to-verilog-and-vhdl.html

    http://www.mathworks.com/matlabcentral/fileexchange/16416-sigma-delta-adc-from-behavioral-model-to-verilog-and-vhdl



Note that the functions:

    1)calculateSNR.m
    2)dbv.m
    3)ds_hann.m

are property of R.Schreier and protected by copyright, as reported:

%Copyright (c) 2009, Richard Schreier
%All rights reserved.
%
%Redistribution and use in source and binary forms, with or without
%modification, are permitted provided that the following conditions are
%met:
%
%    * Redistributions of source code must retain the above copyright
%      notice, this list of conditions and the following disclaimer.
%    * Redistributions in binary form must reproduce the above copyright
%      notice, this list of conditions and the following disclaimer in
%      the documentation and/or other materials provided with the distribution
%
%  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
%  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
%  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
%  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
%  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
%  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
%  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
%  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
%  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
%  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
%  POSSIBILITY OF SUCH DAMAGE
%
