
#methods for setting text range and carret position in text fields

jQuery.fn.selectRange = (start, end) ->
    this.each (i, item) ->
        if this.setSelectionRange
            item.focus()	
            item.setSelectionRange start, end
        else if this.createTextRange
            range = item.createTextRange()
            range.collapse true
            range.moveEnd 'character', end
            range.moveStart 'character', start
            range.select()
    this
    
jQuery.fn.setCaretToPos = (pos) ->
    this.selectRange pos, pos
