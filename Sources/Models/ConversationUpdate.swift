import Foundation

public struct Message: Codable {
    public enum Role: String, Codable {
        case user = "user"
        case assistant = "assistant"
        case system = "system"
        case tool = "tool"
    }
    
    public struct ToolCall: Codable {
        public let id: String
        public let type: String // possibly should be an enum
        public let function: FunctionCall
    }
    
    public struct FunctionCall: Codable {
        public let name: String
        public let arguments: String
    }
    
    public let role: Role
    public let content: String?
    public let tool_calls: [ToolCall]?
    public let tool_call_id: String?
}

public struct ConversationUpdate: Codable {
    public let conversation: [Message]
    // public let messages: [Message]?
    // public let messagesOpenAIFormatted: [Message]?
}
