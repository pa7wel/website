class StronasController < ApplicationController

  layout 'admin'
  before_action :sprawdz_logowanie
  
  def index
    @stronas = Strona.sortuj
  end

  def pokaz
    @strona = Strona.find(params[:id])
  end

  def nowa
    @strona = Strona.new({:nazwa => "Podaj nazwe strony"})
    @kategoria = Kategorie.order('pozycja ASC')
    @licznik = Strona.count + 1
  end

  def utworz
    @strona = Strona.new(strona_parametry)
    if @strona.save
      flash[:notice] = "Strona zostala pomyslnie utworzona."
      redirect_to(:action => 'index')
    else
      @licznik = Strona.count + 1
      @kategoria = Kategorie.order('pozycja ASC')
      render('nowa')
    end
  end

  def edycja
    @strona = Strona.find(params[:id])
    @kategoria = Kategorie.order('pozycja ASC')
    @licznik = Strona.count
  end

  def aktualizuj
    @strona = Strona.find(params[:id])
    if @strona.update_attributes(strona_parametry)
      flash[:notice] = "Strona zostala pomyslnie zaktualizowana."
      redirect_to(:action =>'pokaz', :id => @strona.id)
    else
      @licznik = Strona.count
      @kategoria = Kategoria.order('pozycja ASC')
      render('edycja')
    end
  end

  def usun
    @strona = Strona.find(params[:id])
  end

  def kasuj
    strona = Strona.find(params[:id])
    flash[:notice] = "Strona '#{strona.nazwa}' zostala usunieta."
    redirect_to(:action => 'index')
  end

  def strona_parametry
    params.require(:strona).permit(:nazwa, :pozycja, :widoczna, 
      :created_at, :kategorie_id)
  end
end
