/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 */


// ===================>

import React, { useState } from 'react';
import { View, Text, Image,TextInput, Button, StyleSheet } from 'react-native';

const App = () => {
  const [userName, setUserName] = useState('');

  return (
    <View style={styles.container}>
      <Text>Enter your name:</Text>
      <TextInput
        style={styles.input}
        placeholder="Your Name"
        value={userName}
        onChangeText={(text) => setUserName(text)}
      />

      <Button title="Show My Name" onPress={() => alert(`hello from Android01-> ${userName}!`)} />

      {userName !== '' && (
        <View style={styles.resultContainer}>
          <Text style={styles.resultText}>{userName}!</Text>
        </View>
      )}
      <Image
        source={require('./ashokrpic.png')} 
        style={styles.image}
      />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  input: {
    height: 40,
    borderColor: 'gray',
    borderWidth: 1,
    marginBottom: 10,
    padding: 5,
    width: 200,
  },
  resultContainer: {
    marginTop: 20,
    alignItems: 'center',
  },
  resultText: {
    marginTop: 10,
    fontSize: 18,
  },
  image: {
        width: 200,
        height: 200,
        marginTop: 20,
        borderRadius:75,
      }
});

export default App;

