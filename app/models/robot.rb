class Robot
  include ActiveModel::Model

  attr_accessor :x_coordinate, :y_coordinate, :facing, :command

  def initialize(params={})

    @x_coordinate = params[:x_coordinate]
    @y_coordinate = params[:y_coordinate]
    @facing = params[:facing]
    @commands = params[:command]

  end

  def report
    output = result
  end

  private

    def result
      case @commands.to_s
      when 'MOVE'
        calculate_coordinates
      when 'LEFT'
        determine_facing('LEFT')
      when 'RIGHT'
        determine_facing('RIGHT')
      when 'REPORT'
        if (@facing || @x_coordinate || @y_coordinate) == ""
          @result = "Please Enter X,Y Coordinate and Facing Direction."
        else
          @result = "#{@x_coordinate}, #{@y_coordinate}, #{@facing}"
        end
      end
      @result ? @result : ''
    end

    def calculate_coordinates
      @x_coordinate = @x_coordinate.to_i
      @y_coordinate = @y_coordinate.to_i
      case @facing
      when 'NORTH'
        @y_coordinate = @y_coordinate+1
        @y_coordinate = @y_coordinate-1 if @y_coordinate > 4
      when 'WEST'
        @x_coordinate = @x_coordinate-1
        @x_coordinate = @x_coordinate+1 if @x_coordinate < 0
      when 'SOUTH'
        @y_coordinate = @y_coordinate-1
        @y_coordinate = @y_coordinate+1 if @y_coordinate < 0
      when 'EAST'
        @x_coordinate = @x_coordinate+1
        @x_coordinate = @x_coordinate-1 if @x_coordinate > 4
      end
    end

    def determine_facing(direction)
      case @facing
      when 'NORTH'
        @facing = direction.eql?('LEFT') ? 'WEST' : 'EAST'
      when 'WEST'
        @facing = direction.eql?('LEFT') ? 'SOUTH' : 'NORTH'
      when 'SOUTH'
        @facing = direction.eql?('LEFT') ? 'EAST' : 'WEST'
      when 'EAST'
        @facing = direction.eql?('LEFT') ? 'NORTH' : 'SOUTH'
      end
    end
end
