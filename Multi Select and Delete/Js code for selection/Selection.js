var i, i_ids = "", i_id,

model = this.data.model;

for ( i = 0; i < this.data.selectedRecords.length; i++ ) {
    
    i_id = model.getValue( this.data.selectedRecords[i], "AUTHOR_ID");
    
    i_ids += model.getValue( this.data.selectedRecords[i], "AUTHOR_ID") + ":";
    
}

apex.item( "P4_ARRAY_SELECTION" ).setValue (i_ids);