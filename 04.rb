require 'minitest/autorun'
class GameLive

  def initialize()
    @longitud = 10
    @matrix = Array.new(10) { Array.new(10) { 0 } }
  end

  def llenarGameRandom()
    for i in 0...10
      for j in 0...10
        @matrix[i][j] = rand(2)
      end
    end
  end

  def juegoDibujar()
    @matrix.each do |column|
      column.each do |card|
        print card
        print ' ' # print no imprime un salto de linea al final del output
      end
      puts ' ' # salto de linea
    end
  end

  def llenadoManual(x,y)
    @matrix[x][y] = 1
  end

  def jugandoGame()
    temMatrix = Array.new(10) { Array.new(10) { 0 } }
    for i in 0...10
      for j in 0...10
        if @matrix[i][j] == 0
          temMatrix[i][j] = juegoReglas(i,j,false)
        else
          temMatrix[i][j] = juegoReglas(i,j,true)
        end
      end
    end

    @matrix = temMatrix
    return @matrix
  end

  def juegoReglas(x,y,esViva)
    celulasVivas = 0
    #1
    if x>0 && y>0
      if @matrix[x-1][y-1] == 1
        celulasVivas += 1
      end
    end

    #2
    if y>0
      if @matrix[x][y-1] == 1
        celulasVivas += 1
      end
    end

    #3
    if x < @longitud - 1 && y > 0
      if @matrix[x + 1][y - 1] == 1
        celulasVivas += 1
      end
    end

    #4
    if (x > 0)
      if (@matrix[x - 1][y] == 1)
        celulasVivas += 1
      end
    end

    #5
    if (x < @longitud - 1)
      if (@matrix[x + 1][y] == 1)
        celulasVivas += 1
      end
    end

    #6
    if (x > 0 && y < @longitud - 1)
      if (@matrix[x - 1][y + 1] == 1)
        celulasVivas += 1
      end
    end

    #7
    if (y < @longitud - 1)
      if (@matrix[x][y + 1] == 1)
        celulasVivas += 1
      end
    end

    #8
    if (x < @longitud - 1 && y < @longitud - 1)
      if (@matrix[x + 1][y + 1] == 1)
        celulasVivas += 1
      end
    end

    if esViva
      return (celulasVivas == 2 || celulasVivas == 3) ? 1 : 0;
    else
      return celulasVivas == 3 ? 1 : 0;
    end

  end
end

# obj = GameLive.new()
# obj.juegoDibujar()

# for i in 0..15
#   obj.jugandoGame()
#   puts
#   obj.juegoDibujar()
# end

class GamecaseTest < Minitest::Test
  def initialize()
  end
  def test_game_live
    testObject = GameLive.new()
    # testObject.llenadoManual(0,5)
    # testObject.llenadoManual(1,5)
    # testObject.llenadoManual(2,5)

    # testObject.llenadoManual(5,0)
    # testObject.llenadoManual(5,1)
    # testObject.llenadoManual(5,2)

    testObject.llenadoManual(3,1)
    testObject.llenadoManual(3,2)
    testObject.llenadoManual(3,3)
    testObject.juegoDibujar()

    for i in 0..0
      testObject.jugandoGame()
      puts
      testObject.juegoDibujar()
    end

    # assert_equal[]
  end
end


x = GamecaseTest.new()
x.test_game_live()
