codeunit 50100 "Json Handling BCW"
{
    Access = Internal;

    internal procedure Handlerequestbody(RequestBodyText: Text)
    var
        innerOrdersJarray, lineItemsJArray, lineItemFieldsJArray : JsonArray;
        Jobject, SourceDocumentJObject, innerOrdersJObject, lineItemsJObject, CurrentfieldObject : JsonObject;
        Jtoken, JArrayToken, lineItemsJToken, lineItemFieldsJToken, CurrentfieldToken : JsonToken;
        DocumentKeyValueText, DocumentTypeText, Value : Text;

    begin
        Jobject.ReadFrom(RequestBodyText);
        Jobject.Get('sourceDocument', Jtoken);
        if Jtoken.IsObject() then begin
            SourceDocumentJObject := Jtoken.AsObject();
            SourceDocumentJObject.Get('DocumentKey', Jtoken);
            DocumentKeyValueText := Jtoken.AsValue().AsText();
            SourceDocumentJObject.Get('DocumentType', Jtoken);
            DocumentTypeText := Jtoken.AsValue().AsText();
        end;

        SourceDocumentJObject.Get('innerOrders', Jtoken);
        if Jtoken.IsArray() then begin
            innerOrdersJarray := Jtoken.AsArray();
            foreach JArrayToken in innerOrdersJarray do begin
                if JArrayToken.IsObject then begin
                    innerOrdersJObject := JArrayToken.AsObject();

                    innerOrdersJObject.Get('lineItems', Jtoken);
                    if Jtoken.IsArray() then begin
                        lineItemsJArray := Jtoken.AsArray();

                        foreach lineItemsJToken in lineItemsJArray do begin

                            if lineItemsJToken.IsObject then begin
                                lineItemsJObject := lineItemsJToken.AsObject();

                                lineItemsJObject.get('lineItemFields', lineItemFieldsJToken);
                                if lineItemFieldsJToken.IsArray then begin
                                    lineItemFieldsJArray := lineItemFieldsJToken.AsArray();

                                    lineItemFieldsJArray.Get(9, CurrentfieldToken);
                                    if CurrentfieldToken.IsObject() then begin
                                        CurrentfieldObject := CurrentfieldToken.AsObject();

                                        CurrentfieldObject.get('Value', CurrentfieldToken);
                                        Value := CurrentfieldToken.AsValue().AsText();
        
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
}