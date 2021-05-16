module NotesHelper
  def fix_text(array)
    # array.map!{|x| x=="" ? "\n\n" : x}
    # array.join()

    output = array.map{|x| x=="" ? "\n\n \n" : x}
    output.join()
  end
end
