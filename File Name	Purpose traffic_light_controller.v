`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Traffic Light Controller
//////////////////////////////////////////////////////////////////////////////////

module Traffic_Light_Controller(

    input clk,
    input rst,

    output reg [2:0] light_M1,
    output reg [2:0] light_S,
    output reg [2:0] light_MT,
    output reg [2:0] light_M2

);

//=====================
// State Declaration
//=====================

parameter S1 = 3'd0,
          S2 = 3'd1,
          S3 = 3'd2,
          S4 = 3'd3,
          S5 = 3'd4,
          S6 = 3'd5;

reg [2:0] ps;
reg [3:0] count;

//=====================
// Timing Parameters
//=====================

parameter sec7 = 7;
parameter sec5 = 5;
parameter sec3 = 3;
parameter sec2 = 2;

//=====================
// State Machine
//=====================

always @(posedge clk or posedge rst)
begin

    if(rst)
    begin
        ps <= S1;
        count <= 0;
    end

    else
    begin

        case(ps)

            //-----------------
            S1:
            begin
                if(count < sec7-1)
                begin
                    count <= count + 1;
                    ps <= S1;
                end
                else
                begin
                    count <= 0;
                    ps <= S2;
                end
            end

            //-----------------
            S2:
            begin
                if(count < sec2-1)
                begin
                    count <= count + 1;
                    ps <= S2;
                end
                else
                begin
                    count <= 0;
                    ps <= S3;
                end
            end

            //-----------------
            S3:
            begin
                if(count < sec5-1)
                begin
                    count <= count + 1;
                    ps <= S3;
                end
                else
                begin
                    count <= 0;
                    ps <= S4;
                end
            end

            //-----------------
            S4:
            begin
                if(count < sec2-1)
                begin
                    count <= count + 1;
                    ps <= S4;
                end
                else
                begin
                    count <= 0;
                    ps <= S5;
                end
            end

            //-----------------
            S5:
            begin
                if(count < sec3-1)
                begin
                    count <= count + 1;
                    ps <= S5;
                end
                else
                begin
                    count <= 0;
                    ps <= S6;
                end
            end

            //-----------------
            S6:
            begin
                if(count < sec2-1)
                begin
                    count <= count + 1;
                    ps <= S6;
                end
                else
                begin
                    count <= 0;
                    ps <= S1;
                end
            end

            default:
            begin
                ps <= S1;
                count <= 0;
            end

        endcase

    end

end

//=====================
// Output Logic
//=====================

always @(*)
begin

    // Default values
    light_M1 = 3'b000;
    light_M2 = 3'b000;
    light_MT = 3'b000;
    light_S  = 3'b000;

    case(ps)

        // Main Road Green
        S1:
        begin
            light_M1 = 3'b001;
            light_M2 = 3'b001;
            light_MT = 3'b100;
            light_S  = 3'b100;
        end

        // Main Road Yellow
        S2:
        begin
            light_M1 = 3'b001;
            light_M2 = 3'b010;
            light_MT = 3'b100;
            light_S  = 3'b100;
        end

        // Turning Green
        S3:
        begin
            light_M1 = 3'b001;
            light_M2 = 3'b100;
            light_MT = 3'b001;
            light_S  = 3'b100;
        end

        // Turning Yellow
        S4:
        begin
            light_M1 = 3'b010;
            light_M2 = 3'b100;
            light_MT = 3'b010;
            light_S  = 3'b100;
        end

        // Side Road Green
        S5:
        begin
            light_M1 = 3'b100;
            light_M2 = 3'b100;
            light_MT = 3'b100;
            light_S  = 3'b001;
        end

        // Side Road Yellow
        S6:
        begin
            light_M1 = 3'b100;
            light_M2 = 3'b100;
            light_MT = 3'b100;
            light_S  = 3'b010;
        end

    endcase

end

endmodule
