# app/controllers/calculadora_controller.rb

class CalculadoraController < ApplicationController
  def index
  end

  def calcular
    operando1 = params[:operando1].to_f
    operando2 = params[:operando2].to_f
    operador = params[:operador].to_s.strip.downcase  # Remover espaços e converter para minúsculas


    case operador
    when '+'
      @resultado = operando1 + operando2
    when '-'
      @resultado = operando1 - operando2
    when '*'
      @resultado = operando1 * operando2
    when '/'
      if operando2.zero?
        @resultado = "Divisão por zero não permitida"
      else
        @resultado = operando1 / operando2
      end
    else
      @resultado = "Operador inválido"
    end

    # Renderiza o resultado diretamente, mesmo que seja inválido
    render json: { resultado: @resultado }
  end
end
