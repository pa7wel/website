class KategoriesController < ApplicationController

  layout 'admin'
  before_action :sprawdz_logowanie

  def index
    # @kategorie - zawiera rekordy wyciagniete z bazy danych 
    @kategorie = Kategorie.sortuj
  end

  def pokaz
    # przypisujemy rekord z bazy o podanym id
    @kategoria = Kategorie.find(params[:id])
  end

  def nowa
    # @kategoria = Kategorie.new({:nazwa => "Podaj nazwe kategori"})
    @licznik = Kategorie.count + 1
  end

  def utworz
    @kategorie = Kategorie.new(kategorie_param)
    if @kategorie.save
      flash[:notice] = "Kategoria zostala pomyslnie utworzona."
      redirect_to(:action => "index")
    else
      @licznik = Kategorie.count + 1
      render("nowa")
    end
  end

  def edycja
    @kategoria = Kategorie.find(params[:id])
    @licznik = Kategorie.count
  end

  def usun
    @kategoria = Kategorie.find(params[:id])
  end

  def kasuj
    kategoria = Kategorie.find(params[:id]).destroy
    flash[:notice] = "Kategoria zostala pomyslnie usunieta."
    redirect_to(:action => "index")
  end

  def aktualizuj
      @kategoria = Kategorie.find(params[:id])
    if @kategoria.update_attributes(kategorie_param)
      flash[:notice] = "Kategoria zostala pomyslnie zaktualizowana."
      redirect_to(:action => 'pokaz', :id => @kategoria.id)
    else
      @licznik = Kategorie.count
      render("edycja") 
    end
  end


private
    def kategorie_param
      params.require(:kategoria).permit(:nazwa, :pozycja, 
        :widoczna, :created_at)
    end

end
