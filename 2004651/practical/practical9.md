# Practical-9
#  Create an application that creates an alert upon receiving a message.
![Sample Image](./p9.jpeg)
```import React, { useState, useEffect } from 'react';
import { View, Text, Button, Alert } from 'react-native';

const MessageAlertApp = () => {
  const [newMessage, setNewMessage] = useState(false);

  // Simulating receiving a message
  useEffect(() => {
    const timer = setTimeout(() => {
      setNewMessage(true);
    }, 5000); // Simulating a message received after 5 seconds

    return () => clearTimeout(timer);
  }, []);

  const handleAlert = () => {
    Alert.alert(
      'New Message',
      'You have received a new message!',
      [
        {
          text: 'OK',
          onPress: () => setNewMessage(false),
        },
      ],
      { cancelable: false }
    );
  };

  return (
    <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
      {newMessage && (
        <Button
          title="New Message"
          onPress={handleAlert}
        />
      )}
      {!newMessage && (
        <Text>No new messages</Text>
      )}
    </View>
  );
};

export default MessageAlertApp;
