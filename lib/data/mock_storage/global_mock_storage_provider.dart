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
        content: '''     
  In today's fast-paced world, effective communication has never been more crucial. However, the importance of listening is often overlooked. While many focus on the art of speaking, the ability to listen attentively and empathetically is just as essential in building strong relationships, both professionally and personally. As society becomes increasingly distracted by technology and busy schedules, the need for good listeners has never been more urgent. It is not just about hearing words; it's about understanding and responding in a way that fosters connection and trust.

  The role of a listener goes beyond simply absorbing information. A good listener is someone who is fully present, giving their undivided attention to the speaker. They take the time to understand the message being conveyed and reflect on it before responding thoughtfully. In a world where interruptions and distractions are commonplace, being able to truly listen can set you apart from the rest. It allows for deeper connections, more meaningful conversations, and can lead to a greater sense of empathy and understanding between individuals.

  As we navigate an increasingly complex and interconnected world, the demand for skilled listeners is growing. Whether in the workplace, at home, or in social settings, good listeners are the ones who help create a sense of calm and clarity. They allow people to feel heard, valued, and respected. In the midst of chaos and noise, they are the steady presence that helps guide conversations toward solutions and mutual understanding. Now, more than ever, we must prioritize the need for active listening and cultivate this vital skill to foster stronger, more supportive communities.     
        '''
      ),
      const PostEntity(
        id: 3,
        title: 'Being a Better Creative Director',
        author: 'Britton Stipetic',
        daysAgoPublished: 6,
        minToRead: 10,
        imageSrc: 'assets/images/design-3.jpg',
        category: Category.trending,
        content: '''
  Being a creative director requires a unique combination of vision, leadership, and communication skills. It’s not just about having a flair for design or coming up with the next big idea; it’s about leading a team toward a common goal and guiding them to success. A great creative director understands how to inspire and motivate their team, balancing creative freedom with the need to meet deadlines and business objectives. By fostering an environment of collaboration and trust, they can unlock the full potential of their team, leading to innovative solutions that exceed expectations.

  The key to being a better creative director lies in developing a keen understanding of the project and the brand, as well as the needs of the audience. A strong creative director takes the time to research, analyze, and develop a clear vision that is aligned with the brand’s values and goals. They also know how to adapt to changing circumstances, remaining flexible while staying true to the core creative direction. By being open to feedback and encouraging constructive criticism, they ensure that every idea is explored and refined, ultimately creating a product that resonates deeply with the audience.

  In addition to creative skills, a successful creative director is a strategic thinker. They need to balance creative aspirations with practical considerations like budgets, timelines, and client expectations. Effective communication is crucial in this role, both in terms of presenting ideas clearly to clients and stakeholders and in maintaining an open dialogue with the team. By cultivating both their creative and leadership abilities, a creative director can elevate not only their own work but also the work of everyone they collaborate with, making a lasting impact on the projects they oversee.
        '''
      ),
    ];

    _postsInCategory = _allPosts;
    _postsFiltered = _allPosts;
    notifyListeners();
  }

  void filter(String filter, String column) {

    if (filter.isNotEmpty) {

      if (column == 'Title') {
        _postsFiltered = _postsInCategory
            .where((post) => post.title.toLowerCase().contains(filter.toLowerCase()))
            .toList();
      }
      else if (column == 'Author') {
        _postsFiltered = _postsInCategory
            .where((post) => post.author.toLowerCase().contains(filter.toLowerCase()))
            .toList();
      }
      else {
        throw Exception('Unexpected column');
      }
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
