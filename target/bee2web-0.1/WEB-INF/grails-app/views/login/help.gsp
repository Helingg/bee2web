<html>
<head>
    <title>Welcome to BEE2.0 UI Console</title>
    <meta name="layout" content="main" />
    <script>
        $(function() {
            $( "#accordion" ).accordion();
        });
    </script>
</head>
<body>
<h2> Help </h2>
<div id="accordion">
    <h3>
        <a href="#">Config</a>
    </h3>
    <div>
        <h3>Client</h3>
        Client's information maintenance, include add client, delete client, modify client  and list all clients.<br>
        Client is the sender for HL7 messages, it can be physician or helthcare organizations.<Br>
        NOTE: client's provider is from PV1 or OBR-16(ORU).
        <h3>Recipient</h3>
        Recipient is HL7 message's receiver. We can add, delete, modify and list all recipient here.
        <h3>Rule Group</h3>
        A group for all kinds of rules. Every rule is for one kind of HL7 message type, such as ADT,ORU...<br>
        We can define all rules from Rule Group, such as Set Rule,Copy Rule,Remove Rule and Scripting.
        <h3>Route Config</h3>
        We can decide how HL7 message route from this feature. It send message from client to recipient with <br>
        rule group we set in Rule Group.
        <h3>Q & A</h3>
        <h4>Q: How to add a rule?</h4>
        A: 1. Add a client(config -> Client -> New Client)<br>
        2. Add a recipient(config -> Recipient -> New Recipient)<br>
        3. Add a rule group (config -> Rule Group -> New Rule Group) <br>
        4. Add a rule into rule group (config -> Rule Group -> Select a Rule Group -> Add Set/Copy/Remove/Code Rule Rule)<br>
        5. Route Config (config -> Route Config -> New Bridge) <br>

    </div>
    <h3>
        <a href="#">Messages</a>
    </h3>
    <div>
        <h3>Cache Message</h3>
        When BEE can not find client for incoming message, the message will be save into cache.
        <h3>Received Message</h3>
        All received messages will be shown here. Only one copy will be saved here.
        <h3>Sent Message</h3>
        All sent message will be shown here. When the same message is sent more than 1 time, BEE will <BR>
        set a counter to log how many times it sent.
    </div>
    <h3>
        <a href="#">Report</a>
    </h3>
    <div>
        <h3>Received Report</h3>
        This report will show Summary and Daily report for received messages.It will tell user how many<br>
        messages received for every client and every day.
        <h3>Sent Report</h3>
        This report will show Summary and Daily report for sent messages.It will tell user how many<br>
        messages sent for every client and every day.
    </div>
    <h3>
        <a href="#">Log</a>
    </h3>
    <div>
        <h3>Sent Log</h3>
        Sent message log.
        <h3>Received Log</h3>
        Received message log.
    </div>
</div>
</body>
</html>