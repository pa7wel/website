class ZdjenciesController < ApplicationController

  layout 'admin'

  def index
    @zdjecia = Zdjecie.sortuj
  end

  def nowe
    @zdjecia = Zdjecie.new({:nazwa => "nazwa"})
    @licznik = Zdjecie.count + 1 
    @galeria = Galerie.order('pozycja ASC')
  end

  def utworz
    @zdjecie = Zdjecie.new(zdjecia_parametry)
    if @zdjecie.save
      flash[:notice] = "Zdjecie zostalo przekazana do galerii."
      redirect_to(:action => 'index')
    else
        @licznik = Zdjecie.count + 1
        @galeria = Galerie.order('pozycja ASC')
        render('nowe')
    end
  end

  def pokaz
    @zdjecia = Zdjecie.find(params[:id])
  end

  def edycja
    @zdjecia = Zdjecie.find(params[:id])
    @licznik = Zdjecie.count
    @galeria = Galerie.order('pozycja ASC')
  end

  def aktualizuj
    @zdjecia = Zdjecie.find(params[:id])
    if @zdjecia.update_attributes(zdjecia_parametry)
      flash[:notice] = "Zdjęcie zostało pomyślnie zmodyfikowane"
      redirect_to(:action => 'pokaz', :id => @zdjecia.id)
    else
      @licznik = Zdjecie.count
      @galeria = Galerie.order('pozycjas ASC')
      render("edycja")
    end
  end

  def usun
    @zdjecia = Zdjecie.find(params[:id])
  end

  def kasuj
    zdjecia = Zdjecie.find(params[:id]).destroy
    flash[:notice] = "Zdjecie {#@zdjecia.nazwa}zostało usunięte." 
    redirect_to(:action => 'index')
  end

  def zdjecia_parametry
    params.require(:zdjecia).permit(:galerie_id, :nazwa, :pozycja, :widoczne, :opis, :created_at)
  end
end
