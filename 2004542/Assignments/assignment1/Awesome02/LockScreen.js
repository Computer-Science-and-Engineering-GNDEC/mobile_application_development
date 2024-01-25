import React, { useState } from 'react';
import { View, Text, TextInput, Button, StyleSheet } from 'react-native';

const LockScreen = ({ navigation }) => {
  const [name, setName] = useState('');

  const handleLock = () => {
    // You can store the name in AsyncStorage or any other storage method
    // For simplicity, I'm using navigation state to pass the name
    navigation.navigate('Home', { name });
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Enter Your Name</Text>
      <TextInput
        style={styles.input}
        placeholder="Your Name"
        value={name}
        onChangeText={(text) => setName(text)}
      />
      <Button title="Lock" onPress={handleLock} />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  title: {
    fontSize: 20,
    marginBottom: 20,
  },
  input: {
    width: 200,
    height: 40,
    borderColor: 'gray',
    borderWidth: 1,
    marginBottom: 20,
    padding: 8,
  },
});

export default LockScreen;