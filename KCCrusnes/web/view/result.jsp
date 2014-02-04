<%@ taglib prefix="s" uri="/struts-tags" %>
<html>

    <body>
        <h1>Struts 2 &lt;s:file&gt; file upload example</h1>

        <h4>
            <s:iterator value="filesFileName" var="fileName">
                File Name : <s:property value="#fileName"/>
            </s:iterator>
        </h4>

        <h4>
            <s:iterator value="filesContentType" var="content">
                Content Type : <s:property value="#content"/>
            </s:iterator>
        </h4>

        <h4>
            <s:iterator value="files" var="file">
                File : <s:property value="#file"/>
            </s:iterator>
        </h4>

    </body>
</html>