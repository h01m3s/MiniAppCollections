import React, {useState} from 'react';
import {View, Text, FlatList, Alert, StatusBar, StyleSheet} from 'react-native';
import Header from './Components/Header';
import ListItem from './Components/ListItem';
import AddItem from './Components/AddItem';
import {uuid} from 'uuidv4';

export default App = () => {
  const [items, setItems] = useState([]);

  const deleteItem = id => {
    setItems(previousItems => previousItems.filter(item => item.id !== id));
  };

  const addItem = text => {
    if (!text) {
      Alert.alert('Error', 'Please enter an item', {text: 'Ok'});
    } else {
      setItems(previousItems => [
        {id: Math.random() * 1000, text},
        ...previousItems,
      ]);
    }
  };

  return (
    <View style={styles.container}>
      <View style={{backgroundColor: 'darkslateblue', height: 64}}>
        <StatusBar barStyle="light-content" translucent={true} />
      </View>
      <Header title="Shopping List" />
      <AddItem addItem={addItem} />
      <FlatList
        data={items}
        renderItem={({item}) => (
          <ListItem item={item} deleteItem={deleteItem} />
        )}
        keyExtractor={item => item.id.toString()}
      />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    // paddingTop: 60,
  },
});
