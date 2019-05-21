package kr.maak.util;

import org.jdom2.JDOMException;
import org.jdom2.input.DOMBuilder;
import org.jdom2.output.DOMOutputter;

/**
 * Created by KIMKT on 2018-03-13.
 */
public class DocumentConverter {

    public org.jdom2.Document convertDOMtoJDOM(org.w3c.dom.Document input) {
        DOMBuilder builder = new DOMBuilder();
        org.jdom2.Document output = builder.build(input);
        return output;
    }

    public org.w3c.dom.Document convertJDOMToDOM(org.jdom2.Document jdomDoc) throws JDOMException {

        DOMOutputter outputter = new DOMOutputter();
        return outputter.output(jdomDoc);
    }
}