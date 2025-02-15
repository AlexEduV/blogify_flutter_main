import 'package:blogify_flutter_main/domain/helpers/category_helper.dart';
import 'package:blogify_flutter_main/domain/entities/post_entity.dart';
import 'package:flutter/material.dart';

class GlobalMockStorageProvider extends ChangeNotifier {

  List<PostEntity> _allPosts = [];
  List<PostEntity> get allPosts => _allPosts;

  List<PostEntity> _postsInCategory = [];
  List<PostEntity> get postsInCategory => _postsInCategory;

  List<PostEntity> _postsFiltered = [];
  List<PostEntity> get postsFiltered => _postsFiltered;

  void initStorage() {

    _allPosts = [
      const PostEntity(
        id: 1,
        title: 'Where Web 3\nis Going to?',
        author: 'Josh Brian',
        daysAgoPublished: 1,
        minToRead: 5,
        imageSrc: 'assets/images/design-2.jpg',
        category: Category.tech,
        content: '''
        
        The evolution of the internet has been marked by transformative shifts, from the static pages of Web 1.0 to the interactive and social-driven Web 2.0. Now, Web 3.0 promises a decentralized future where users regain control over their data, digital assets, and online identities. Built on blockchain technology, Web 3 introduces concepts like smart contracts, decentralized finance (DeFi), and tokenized economies, fundamentally changing how we interact with online platforms. Instead of relying on centralized corporations, users in a Web 3 ecosystem engage with peer-to-peer networks, reducing dependency on intermediaries and enabling a more transparent digital space.

        However, Web 3 is still in its infancy, facing challenges that range from scalability to user adoption. While decentralization is an attractive concept, the current infrastructure struggles with high transaction fees, slow processing times, and complex user experiences. Moreover, regulatory concerns loom over the industry, as governments and institutions grapple with how to integrate blockchain-based systems into existing legal frameworks. Despite these hurdles, innovations like Layer 2 solutions, cross-chain interoperability, and decentralized autonomous organizations (DAOs) are pushing the boundaries of what’s possible, paving the way for a more accessible and efficient decentralized web.

        As Web 3 matures, its impact on industries beyond finance is becoming evident. From decentralized social media platforms that prevent censorship to blockchain-powered supply chains ensuring transparency, the potential applications extend far beyond cryptocurrencies. The transition to Web 3 won’t happen overnight, but the movement toward a more user-centric, secure, and transparent internet is well underway. Whether Web 3 fulfills its promise or faces a hybrid evolution alongside traditional systems remains to be seen, but one thing is certain—change is coming, and it’s redefining the future of the internet as we know it.
        
        '''
      ),
      const PostEntity(
        id: 2,
        title: 'Good Listeners Urgently Required',
        author: 'Jay Fitzgerald',
        daysAgoPublished: 2,
        imageSrc: 'assets/images/leadership-2.jpg',
        minToRead: 15,
        category: Category.trending,
      ),
      const PostEntity(
        id: 3,
        title: 'Being a Better Creative Director',
        author: 'Britton Stipetic',
        daysAgoPublished: 6,
        minToRead: 10,
        imageSrc: 'assets/images/design-3.jpg',
        category: Category.trending,
      ),
    ];

    _postsInCategory = _allPosts;
    _postsFiltered = _allPosts;
    notifyListeners();
  }

  void filter(String filter) {

    if (filter.isNotEmpty) {

      _postsFiltered = _postsInCategory
          .where((post) => post.author.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    }
    else {
      _postsFiltered = _postsInCategory;
    }

    notifyListeners();
  }

  void loadAllInCategory(Category category) {

    _postsInCategory = _allPosts.where((post) => post.category == category).toList();
    _postsFiltered = _postsInCategory;
    notifyListeners();
  }

  void likePost(int id) {
    // Find the post that matches the id
    final postIndex = _allPosts.indexWhere((post) => post.id == id);

    if (postIndex != -1) {

      final updatedPost = _allPosts[postIndex].copyWith(isLiked: !_allPosts[postIndex].isLiked);
      _allPosts[postIndex] = updatedPost;
      notifyListeners();
    }

  }

}
